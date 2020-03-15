class AddHouseholdToBills < ActiveRecord::Migration
  def change
    add_reference :bills, :household, type: :uuid, null: false,  index: true, foreign_key: true
  end
end
