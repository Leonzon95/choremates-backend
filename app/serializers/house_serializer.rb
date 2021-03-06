class HouseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
  has_many :rules
  has_many :house_members
  has_many :chores
end
