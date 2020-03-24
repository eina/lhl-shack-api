class AddHousekeepingToHousehold < ActiveRecord::Migration
  def change
     add_column :households, :housekeeping, :jsonb
  end
end
