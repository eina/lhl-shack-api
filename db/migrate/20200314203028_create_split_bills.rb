class CreateSplitBills < ActiveRecord::Migration
  def change
    create_table :split_bills do |t|

      t.timestamps null: false
    end
  end
end
