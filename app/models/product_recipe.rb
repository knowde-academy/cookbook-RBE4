class ProductRecipe < ApplicationRecord
  validates :quantity, presence: true, numericality: { is_integer: true, greater_than: 0}
  validates :product, uniqueness: { scope: [ :recipe_id, :product_id ] }
  
  belongs_to :product
  belongs_to :recipe
end
