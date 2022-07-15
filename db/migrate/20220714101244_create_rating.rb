class CreateRating < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :author, null: false
      t.integer :rating, null: false
      t.integer :recipe_id, index: true, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
