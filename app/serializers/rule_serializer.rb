class RuleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :id
  belongs_to :house
end
