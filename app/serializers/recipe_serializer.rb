class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :price, :level, :comments
  
  def price
    object.price ? object.price.to_f : "unknown"
  end
  
  def level
    object.level || "unknown"
  end
end
