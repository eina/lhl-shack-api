class ChangeAgreementsPrimaryKey < ActiveRecord::Migration
  def change
    add_column :agreements, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :agreements do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE agreements ADD PRIMARY KEY (id);"
  end
end
