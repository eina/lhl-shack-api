class AddDetailsToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :first_name, :string
    add_column :landlords, :last_name, :string
    add_column :landlords, :phone_number, :string
    add_column :landlords, :email, :string
    add_column :landlords, :company, :string
  end
end
