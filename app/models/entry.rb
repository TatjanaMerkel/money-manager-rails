class Entry < ApplicationRecord
  belongs_to :currency
  belongs_to :category

  validates_presence_of :title
  validates_presence_of :amount
  validates_presence_of :date
end
