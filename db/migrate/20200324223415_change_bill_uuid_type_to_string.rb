class ChangeBillUuidTypeToString < ActiveRecord::Migration
  def change
    change_column :bills, :bill_uuid, :string
  end
end
