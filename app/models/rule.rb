class Rule < ApplicationRecord
  belongs_to :house

  validates :description, presence: true
end
