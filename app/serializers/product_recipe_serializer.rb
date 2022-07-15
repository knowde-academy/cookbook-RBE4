class ProductRecipeSerializer < ActiveModel::Serializer
  attributes :id, :product, :quantity
  
  def id
    object.product.id
  end  
  
  def product
    object.product.name
  end  
  
  def quantity
    object.quantity
  end
end
