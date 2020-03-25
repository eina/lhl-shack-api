class CollapseHousekeepingToHousehold < ActiveRecord::Migration
  def change
    drop_table(:housekeepings)
  end
end
