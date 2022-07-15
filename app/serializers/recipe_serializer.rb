class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :price, :level, :products
  
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
end
