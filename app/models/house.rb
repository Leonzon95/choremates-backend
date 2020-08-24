class House < ApplicationRecord
    has_many :rules
    has_many :house_members
end
