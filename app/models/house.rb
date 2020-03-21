class House < ActiveRecord::Base
 # move 
  belongs_to :user, foreign_key: "user_id"
  belongs_to :landlord, foreign_key: "landlord_id"
​
  has_one :housekeepings
  has_many :bills
  has_many :agreements
  has_many :documents
  validates_presence_of :total_rent_amt, :total_security_deposit_amt, :address, :number_of_rooms, :number_of_bathrooms, :start_date, :end_date
end
