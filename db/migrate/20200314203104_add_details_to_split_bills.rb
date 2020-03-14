class AddDetailsToSplitBills < ActiveRecord::Migration
  def change
    add_column :split_bills, :bill_portion, :integer
  end
end
