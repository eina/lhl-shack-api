class Bill < ActiveRecord::Base
  has_many :split_bills
  has_many :users, through: :split_bills
end
