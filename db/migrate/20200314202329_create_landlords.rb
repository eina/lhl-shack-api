class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|

      t.timestamps null: false
    end
  end
end
