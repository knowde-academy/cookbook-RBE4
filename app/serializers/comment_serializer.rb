class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author, :body, :recipe_id, :created_at
end
