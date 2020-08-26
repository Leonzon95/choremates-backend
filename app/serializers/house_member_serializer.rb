class HouseMemberSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
  belongs_to :house
end
