class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.string :body, null: false
      t.integer :recipe_id, index: true, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
