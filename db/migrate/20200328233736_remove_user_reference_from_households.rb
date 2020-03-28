class RemoveUserReferenceFromHouseholds < ActiveRecord::Migration
  def change
    remove_reference :households, :user, index: true, foreign_key: true
  end
end