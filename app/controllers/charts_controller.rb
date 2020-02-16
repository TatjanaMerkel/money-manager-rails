class ChartsController < ApplicationController
  include AuthentificationHelper
  before_action :get_account, :parse_params

  def year
    render json: @account.all_from_year(@year, @type)
  end

  def month
    render json: @account.all_from_month(@year, @month, @type)
  end

  def day
    render json: @account.all_from_day(@year, @month, @day, @type)
  end

  def incomes
    result = []

    categories = @account.categories.where incomeExpense: 0

    title_and_headers = ['']
    categories.each do |category|
      title_and_headers << category.name
    end
    result << title_and_headers

    now = DateTime.now
    before = now - 3.months
    (before..now).select {|d| d.day == 1}.each do |start_of_month|

      end_of_month = start_of_month.end_of_month
      arr = [I18n.t(Date::MONTHNAMES[start_of_month.month].downcase)]

      categories.each do |category|
        arr << @account.entries
                   .where(category: category, date: start_of_month..end_of_month)
                   .sum('amount')
      end

      result << arr
    end

    render json: result
  end

  def expenses
    result = []

    now = DateTime.now
    before = now - 3.months

    db_rows = @account.entries
                  .select('category_id, SUM(amount) as tot')
                  .where(date: before..now)
                  .joins(:category)
                  .where('categories.incomeExpense' => 1)
                  .group(:category_id)
                  .order('tot asc')

    categories = []
    db_rows.each do |db_row|
      categories << @account.categories.find(db_row.category_id)
    end

    title_and_headers = ['']
    categories.each do |category|
      title_and_headers << category.name
    end
    result << title_and_headers

    (before..now).select {|d| d.day == 1}.each do |start_of_month|

      end_of_month = start_of_month.end_of_month
      arr = [I18n.t(Date::MONTHNAMES[start_of_month.month].downcase)]

      categories.each do |category|
        arr << -@account.entries
                   .where(category: category, date: start_of_month..end_of_month)
                   .sum('amount')
      end

      result << arr
    end

    render json: result
  end

  def auth_failed
    # show failure message with 401 status and accountname if exists
    account_name = '<Accountname_not_provided>'
    if @account
      account_name = @account.to_s
    end
    render plain: "Authentification failed with Account #{account_name}.", status: 401
  end

  private

  def get_account
    # get currently signed in user

    account = AuthentificationHelper.check_login(session[:user_id])

    if account
      @account = account
    else
      auth_failed
    end
  end

  def parse_params
    @type = params[:type] if params[:type]
    @year = Integer(params[:year]) if params[:year]
    @month = Integer(params[:month]) if params[:month]
    @day = Integer(params[:day]) if params[:day]

  end
end
