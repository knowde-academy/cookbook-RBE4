class ChangeAuthorToUserId < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :author, :string
    add_reference :comments, :user, index: true, null: false, foreign_key: true
  end
end
