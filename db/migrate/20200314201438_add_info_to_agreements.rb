class AddInfoToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :is_complete, :boolean
    add_column :agreements, :is_expired, :boolean
  end
end
