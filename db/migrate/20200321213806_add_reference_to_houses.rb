class AddReferenceToHouses < ActiveRecord::Migration
  def change
    add_reference :agreements, :household, index: true, foreign_key: true, on_delete: :cascade
    add_reference :bills, :household, index: true, foreign_key: true, on_delete: :cascade
    add_reference :documents, :household, index: true, foreign_key: true, on_delete: :cascade
    add_reference :housekeepings, :household, index: true, foreign_key: true, on_delete: :cascade
  end
end
