class ProductRecipe < ApplicationRecord
  validates :quantity, presence: true, numericality: { is_integer: true, greater_than: 0}
  validates :price, presence: true, numericality: { greater_than: 0.0, less_than: 10**6 }
  validates :product, uniqueness: { scope: [ :recipe_id, :product_id ] }
  
  belongs_to :product
  belongs_to :recipe
  
  after_commit :update_price
  
  private
  
  def update_price
    recipe.update(price: recipe.product_recipes.sum { |p| p.price * p.quantity })
  end
end
