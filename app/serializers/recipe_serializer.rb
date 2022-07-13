class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :price
  
  def price
    object.price ? object.price.to_f : "unknown"
  end
end
