class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :price, :level, :comments, :time, :ratings, :products, :video_link
  
  def products
    self.object.product_recipes.map do |item|
      {
        id: item.product.id, 
        name: item.product.name,
        quantity: item.quantity
      }
    end
  end
  
  def price
    object.price ? object.price.to_f : "unknown"
  end
  
  def level
    object.level || "unknown"
  end
  
  def time
    object.time || "unknown"
  end
  
  def video_link
    object.video_link || "unknown"
  end
end
