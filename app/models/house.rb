class House < ApplicationRecord
    has_many :rules
    has_many :house_members

    validates :name, uniqueness: true
end
