class House < ApplicationRecord
    has_many :chores
    has_many :rules
    has_many :house_members

    validates :name, uniqueness: true
    validates :name, presence: true
end
