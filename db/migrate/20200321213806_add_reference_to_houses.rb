class AddReferenceToHouses < ActiveRecord::Migration
  def change
    add_reference :agreements, :house, type: :uuid, index: true, foreign_key: true, on_delete: :cascade
    add_reference :bills, :house, type: :uuid, index: true, foreign_key: true, on_delete: :cascade
    add_reference :documents, :house, type: :uuid, index: true, foreign_key: true, on_delete: :cascade
    add_reference :housekeepings, :house, type: :uuid, index: true, foreign_key: true, on_delete: :cascade
  end
end
