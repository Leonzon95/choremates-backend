class HouseMemberSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  belongs_to :house
end
