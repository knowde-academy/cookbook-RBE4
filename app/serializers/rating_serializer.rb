class RateSerializer < ActiveModel::Serializer
  attributes :id, :author, :rating, :recipe_id
end
