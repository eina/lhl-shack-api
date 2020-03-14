class AddJsonbToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :form_values, :jsonb
  end
end
