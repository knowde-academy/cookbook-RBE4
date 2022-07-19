class ChangeAuthorInRating < ActiveRecord::Migration[6.1]
  def change
    remove_column :ratings, :author, :string
    add_reference :ratings, :user, index: :true, foreign_key: true, null: false 
    add_index :ratings, [:recipe_id, :user_id], unique: true
  end
end
