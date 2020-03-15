class AddForeignKeyToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :households, type: :uuid, null: false, on_delete: :cascade
    # add_foreign_key :documents, :households
  end
end
