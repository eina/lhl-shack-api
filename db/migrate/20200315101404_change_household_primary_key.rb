class ChangeHouseholdPrimaryKey < ActiveRecord::Migration
  def change
    add_column :households, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :households do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE households ADD PRIMARY KEY (id);"
  end
end
