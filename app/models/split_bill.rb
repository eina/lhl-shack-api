class SplitBill < ActiveRecord::Base
  belongs_to :users
  belongs_to :bills
end
