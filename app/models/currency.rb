class Currency < ApplicationRecord
  has_many :entries

  validates_presence_of :name
  validates_presence_of :symbol
end
