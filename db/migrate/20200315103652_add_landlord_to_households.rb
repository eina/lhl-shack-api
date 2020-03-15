class AddLandlordToHouseholds < ActiveRecord::Migration
  def change
    add_reference :households, :landlord, null: false, index: true, foreign_key: true
  end
end
