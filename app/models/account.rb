class Account < ApplicationRecord
  has_one :configuration
  has_many :categories, through: :configuration
  has_many :entries, through: :categories

  validates_presence_of :email
  validates_presence_of :password_digest, on: :create

  has_secure_password

  before_create :set_salt

  def get_all(account)
    account.entries.all
  end

  def all_from_year(year, type = nil)
    dt = DateTime.new(year)
    boy = dt.beginning_of_year
    eoy = dt.end_of_year
    all_between boy, eoy, type
  end

  def all_from_month(year, month, type = nil)
    dt = DateTime.new(year, month)
    bom = dt.beginning_of_month
    eom = dt.end_of_month
    all_between bom, eom, type
  end

  def all_from_day(year, month, day, type = nil)
    bod = DateTime.new(year, month, day, 0, 0, 0).prev_day.end_of_day
    eod = bod.next_day.end_of_day

    all_between bod, eod, type
  end

  def expenses
    all_between Date.today.beginning_of_month, Date.today.end_of_month, 'expense'
  end

  def incomes
    all_between Date.today.beginning_of_month, Date.today.end_of_month, 'income'
  end

  def balance
    (expenses + incomes).round 2
  end


  def inspect
    to_s
  end

  def to_s
    "#<Account #{email}>"
  end

  def income_categories
    incomes = []
    categories.all.each do |category|
      if category.incomeExpense == 0
        incomes << category
      end
    end
    incomes
  end

  def expense_categories
    expenses = []
    categories.all.each do |category|
      if category.incomeExpense != 0
        expenses << category
      end
    end
    expenses
  end


  def activate?(s)
    if s == salt
      update_attribute :activated, true
      true
    else
      false
    end
  end

  private

  def set_salt
    require 'securerandom'

    write_attribute :salt, SecureRandom.hex

  end

  private

  def all_between(beginning_date, end_date, type = nil)
    # query all entries between bdate and edate.
    # returns data ready to be sent to google charts


    connection = ActiveRecord::Base.connection

    case type
    when 'income_expense'
      income_expense_per_month = []

      (beginning_date..end_date).select {|d| d.day == 1}.each do |first_day|

        last_day = first_day.end_of_month

        entries_of_month = entries.where date: first_day..last_day

        month_income = 0
        month_expense = 0

        entries_of_month.each do |entry|
          puts entry.title
          if entry.amount > 0
            month_income += entry.amount
          else
            month_expense += entry.amount
          end
        end


        income_expense_per_month << [I18n.t(Date::MONTHNAMES[first_day.month].downcase), month_income, month_expense]
      end

      income_expense_per_month

    when 'categories'

      sql = "SELECT categories.color, categories.name, SUM(entries.amount) FROM categories, entries, accounts, configurations
                  WHERE categories.id = entries.category_id
                        AND configurations.id = categories.configuration_id
                        AND configurations.account_id = #{id}
                        AND accounts.id = #{id}
                        AND date BETWEEN ('#{beginning_date.to_s(:db)}') AND ('#{end_date.to_s(:db)}')
                        AND amount < 0
                  GROUP BY categories.name;"

      connection.query sql

    when 'balance'

      balance_per_month = []

      (beginning_date..end_date).select {|d| d.day == 1}.each do |first_day|

        last_day = first_day.end_of_month

        entries_of_month = entries.where date: first_day..last_day

        month_amount = 0

        entries_of_month.each do |entry|
          month_amount += entry.amount
        end

        balance_per_month << [I18n.t(Date::MONTHNAMES[first_day.month].downcase), month_amount, '']
      end

      balance_per_month

    when 'income'

      entries.where(date: beginning_date..end_date).where('amount > ?', 0).sum(:amount)


    when 'expense'

      entries.where(date: beginning_date..end_date).where('amount < ?', 0).sum(:amount)

    else
      entries.where date: beginning_date..end_date
    end

  end
end


