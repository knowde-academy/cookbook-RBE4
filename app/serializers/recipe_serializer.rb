class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :price, :level
  
  def price
    object.price ? object.price.to_f : "unknown"
  end
  
  def level
    object.level || "unknown"
  end
end
