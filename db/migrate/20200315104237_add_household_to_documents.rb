class AddHouseholdToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :household, type: :uuid, null: false, index: true, foreign_key: true
  end
end
