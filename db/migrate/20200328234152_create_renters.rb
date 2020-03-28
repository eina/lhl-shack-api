class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.references :user, index: true, foreign_key: true
      t.references :household, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
