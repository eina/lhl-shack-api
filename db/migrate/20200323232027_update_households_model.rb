class UpdateHouseholdsModel < ActiveRecord::Migration
  def change
    # remove start_date and end_date from house
    remove_column :houses, :start_date
    remove_column :houses, :end_date
    # add start_date and end_date column to households
    add_column :households, :start_date, :date
    add_column :households, :end_date, :date
    add_column :households, :is_active, :boolean
  end
end
