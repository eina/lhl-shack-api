class ChangeHouseholdsToHouses < ActiveRecord::Migration
  def change
    rename_table :households, :houses
  end
end
