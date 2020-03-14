class AddHouseholdDetails < ActiveRecord::Migration
  def change
    add_column :households, :total_rent_amt, :integer
    add_column :households, :total_security_deposit_amt, :integer
    add_column :households, :address, :string
    add_column :households, :number_of_rooms, :integer
    add_column :households, :number_of_bathrooms, :integer
    add_column :households, :pet_friendly, :boolean
    add_column :households, :smoking_allowed, :boolean
    add_column :households, :start_date, :date
    add_column :households, :end_date, :date 
  end
end
