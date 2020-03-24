class UpdateBillsTable < ActiveRecord::Migration
  def change
    add_column :bills, :user_amount, :integer
    add_column :bills, :bill_uuid, :uuid    
  end
end
