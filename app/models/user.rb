class User < ActiveRecord::Base
  has_many :split_bills
  has_many :bills, through: :split_bills
end
