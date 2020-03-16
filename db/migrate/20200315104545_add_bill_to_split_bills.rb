class AddBillToSplitBills < ActiveRecord::Migration
  def change
    add_reference :split_bills, :bill, null: false, index: true, foreign_key: true
  end
end
