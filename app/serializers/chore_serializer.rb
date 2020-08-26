class ChoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id, :difficulty, :house_id, :house_member_id
  belongs_to :house
  belongs_to :house_member, optional: true
end
