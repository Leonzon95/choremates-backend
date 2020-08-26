class ChoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id, :difficulty
  belongs_to :house
  belongs_to :house_member, optional: true
end
