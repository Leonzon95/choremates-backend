class Chore < ApplicationRecord
  belongs_to :house
  belongs_to :house_member, optional: true


  validates :name, presence: true
  validates :difficulty, presence: true
end
