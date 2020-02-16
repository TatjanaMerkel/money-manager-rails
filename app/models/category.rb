class Category < ApplicationRecord
  belongs_to :configuration
  has_many :entries
  has_one :account, through: :configuration

  validates_presence_of :name
  validates_presence_of :color
  validates_presence_of :icon
  validates_presence_of :incomeExpense

  def sum_all_entries
    sum = 0
    entries.each do |e|

      sum += e.amount if e.amount
    end
    sum
  end

  def svg_icon
    doc = File.open("#{Rails.root}/app/assets/images/icons/#{icon}") { |f| Nokogiri::XML(f) }
    svg = doc.root
    svg["width"] = "40px"
    svg["height"] = "40px"
    svg["style"] = "fill: #{color}"

    svg.to_s.html_safe
  end
end
