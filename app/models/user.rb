class User < ActiveRecord::Base
  has_many :split_bills
  has_many :bills, through: :split_bills
  has_many :households
  validates_presence_of :first_name, :last_name, :phone_number, :email, :password
end
