class AddPriceToProductRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :product_recipes, :price, :decimal, precision: 8, scale: 2, default: 0
    change_column_default :recipes, :price, from: nil, to: 0
  end
end
