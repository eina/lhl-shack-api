class RemoveHouseReferences < ActiveRecord::Migration
  def change
    rename_column :agreements, :household_id, :house_id
    rename_column :bills, :household_id, :house_id
    rename_column :documents, :household_id, :house_id
    rename_column :housekeepings, :household_id, :house_id

    remove_reference :agreements, :house, index: true, foreign_key: true
    remove_reference :bills, :house, index: true, foreign_key: true
    remove_reference :documents, :house, index: true, foreign_key: true
    remove_reference :housekeepings, :house, index: true, foreign_key: true
  end
end
