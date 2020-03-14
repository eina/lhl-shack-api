class Bill < ActiveRecord::Base
  has_many :split_bills
  has_many :users, through: :split_bills
  belongs_to :households
  validates_presence_of :total_amount, :due_date, :name, :interval
end
