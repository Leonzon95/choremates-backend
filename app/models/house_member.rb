class HouseMember < ApplicationRecord
  belongs_to :house
  has_many :chores

  validates :name, presence: true
end
