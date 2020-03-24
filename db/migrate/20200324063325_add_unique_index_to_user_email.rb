class AddUniqueIndexToUserEmail < ActiveRecord::Migration
  def change
    # avoid duplicate emails
    add_index :users, :email, unique: true
  end
end
