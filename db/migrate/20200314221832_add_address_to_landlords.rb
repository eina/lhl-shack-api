class AddAddressToLandlords < ActiveRecord::Migration
  def change
    add_column :landlords, :address, :string
  end
end
