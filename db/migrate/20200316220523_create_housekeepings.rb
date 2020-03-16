class CreateHousekeepings < ActiveRecord::Migration
  def change
    create_table :housekeepings do |t|
      t.jsonb :housekeeping_values
      t.references :household, type: :uuid, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
