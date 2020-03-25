class House < ActiveRecord::Base
  belongs_to :landlord, foreign_key: "landlord_id"
  has_many :users, through: :households, foreign_key: "household_id"
  validates_presence_of :landlord_id
  # validates_presence_of :total_rent_amt, :total_security_deposit_amt, :address, :number_of_rooms, :number_of_bathrooms  
end
