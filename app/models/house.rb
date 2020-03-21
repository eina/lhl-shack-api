class House < ActiveRecord::Base
  belongs_to :landlord, foreign_key: "landlord_id"
  has_many :users, through: :households, foreign_key: "household_id"
  validates_presence_of :total_rent_amt, :total_security_deposit_amt, :address, :number_of_rooms, :number_of_bathrooms, :start_date, :end_date
end
