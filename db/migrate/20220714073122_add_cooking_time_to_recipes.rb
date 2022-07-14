class AddCookingTimeToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :time, :integer
  end
end
