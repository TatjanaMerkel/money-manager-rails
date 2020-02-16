class Locale < ApplicationRecord
  has_many :configurations

  validates_presence_of :name

  def to_s
    name
  end
end
