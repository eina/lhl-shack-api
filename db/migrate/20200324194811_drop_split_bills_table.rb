class DropSplitBillsTable < ActiveRecord::Migration
  def change
    drop_table(:split_bills)
  end
end
