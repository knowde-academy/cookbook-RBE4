class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :body, :recipe_id, :created_at
end
