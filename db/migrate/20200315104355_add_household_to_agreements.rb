class AddHouseholdToAgreements < ActiveRecord::Migration
  def change
    add_reference :agreements, :household, type: :uuid, null: false, index: true, foreign_key: true
  end
end
