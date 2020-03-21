class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.references :user, index: true, foreign_key: true
      t.references :house, type: :uuid, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
\