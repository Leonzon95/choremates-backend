class Chore < ApplicationRecord
  belongs_to :house_member
  belongs_to :day
end
