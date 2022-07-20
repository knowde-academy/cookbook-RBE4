class ProductRecipeSerializer < ActiveModel::Serializer
  attributes :id, :product, :quantity, :price
  
  def id
    object.product.id
  end  
  
  def product
    object.product.name
  end  
  
  def quantity
    object.quantity
  end
  
  def price
    object.price
  end
end
