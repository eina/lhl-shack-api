class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.jsonb :form_values
      t.boolean :is_complete
      t.boolean :is_expired
      t.timestamps null: false
    end
  end
end
