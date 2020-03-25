class AddUserReferenceToBills < ActiveRecord::Migration
  def change
    add_reference :bills, :user, index: true
    add_foreign_key :bills, :users
  end
end
