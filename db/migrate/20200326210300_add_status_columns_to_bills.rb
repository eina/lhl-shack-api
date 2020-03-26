class AddStatusColumnsToBills < ActiveRecord::Migration
  def change
    add_column :bills, :user_status, :string
    add_column :bills, :bill_status, :string
  end
end
