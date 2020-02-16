class Configuration < ApplicationRecord
  has_many :categories
  belongs_to :locale
  belongs_to :account

  validates_presence_of :avatar
end
