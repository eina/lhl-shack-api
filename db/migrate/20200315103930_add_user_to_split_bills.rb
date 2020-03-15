class AddUserToSplitBills < ActiveRecord::Migration
  def change
    add_reference :split_bills, :user, null: false, index: true, foreign_key: true
  end
end
