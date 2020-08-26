class ChoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
  belongs_to :house
  belongs_to :house_member
end
