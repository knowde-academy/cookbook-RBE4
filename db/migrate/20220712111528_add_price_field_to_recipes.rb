class AddPriceFieldToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :price, :decimal, precision: 8, scale: 2
  end
end
