class RemoveUserFromHouses < ActiveRecord::Migration
  def change
    remove_reference :houses, :user, index: true, foreign_key: true
  end
end
