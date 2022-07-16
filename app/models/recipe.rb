class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :level, :inclusion => 1..5, allow_nil: true
  validates :price, numericality: { greater_than: 0.0, less_than: 10**6 }, allow_nil: true
  validates :time, numericality: { in: 0..10080 }, allow_nil: true
  
  has_many :comments, lambda { order(created_at: :desc) }
  has_many :ratings, lambda { order(created_at: :desc) }
  has_many :product_recipes, dependent: :destroy
  has_many :products, through: :product_recipes
end
