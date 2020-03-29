class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :messages
      t.string :author
      t.references :household, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
