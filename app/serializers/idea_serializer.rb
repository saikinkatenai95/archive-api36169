class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :category
end
