class CreateProductsRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :product_recipes do |t|
      t.references :recipe, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :quantity, null: false
      
      t.timestamps
    end
    
    add_index :product_recipes, [:recipe_id, :product_id], unique: true
  end
end
