class Landlord < ActiveRecord::Base
  has_many :households
  validates_presence_of :first_name, :last_name, :phone_number, :email, :address
end
