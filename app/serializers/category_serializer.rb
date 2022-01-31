class CategorySerializer < ActiveModel::Serializer
  require 'time'
  attributes :id, :name, :created_at
  has_many :ideas

def created_at
  object.created_at.to_i
end

end
