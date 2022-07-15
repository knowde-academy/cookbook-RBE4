class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :price, :level, :comments, :time, :ratings
  
  def price
    object.price ? object.price.to_f : "unknown"
  end
  
  def level
    object.level || "unknown"
  end
  
  def time
    object.time || "unknown"
  end
end
