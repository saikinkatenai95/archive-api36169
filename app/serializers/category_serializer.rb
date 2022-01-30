class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at
  has_many :ideas
end
