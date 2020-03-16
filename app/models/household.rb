class Household < ActiveRecord::Base
  has_one :housekeepings
  has_many :bills
  has_many :agreements
  has_many :documents
  belongs_to :users
  belongs_to :landlords
  
  validates_presence_of :total_rent_amt, :total_security_deposit_amt, :address, :number_of_rooms, :number_of_bathrooms, :start_date, :end_date
end
