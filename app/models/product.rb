class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  has_many :product_recipes, dependent: :destroy
  has_many :recipes, through: :product_recipes
end
