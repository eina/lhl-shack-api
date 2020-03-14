class SplitBill < ActiveRecord::Base
  belongs_to :users
  belongs_to :bills
  validates_presence_of :bill_portion
end
