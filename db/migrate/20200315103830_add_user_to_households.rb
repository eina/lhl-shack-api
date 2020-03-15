class AddUserToHouseholds < ActiveRecord::Migration
  def change
    add_reference :households, :user, null: false, index: true, foreign_key: true
  end
end
