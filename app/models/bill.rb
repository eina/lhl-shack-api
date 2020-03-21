class Bill < ActiveRecord::Base
  has_many :split_bills
  has_many :users, through: :split_bills
  belongs_to :houses
  validates_presence_of :total_amount, :due_date, :name, :interval
end
