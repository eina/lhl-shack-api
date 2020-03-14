class AddBillDetails < ActiveRecord::Migration
  def change
    add_column :bills, :total_amount, :integer
    add_column :bills, :due_date, :date
    add_column :bills, :name, :string
    add_column :bills, :interval, :string
  end
end
