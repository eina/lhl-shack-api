class Bill < ActiveRecord::Base
  belongs_to :households

  # has_many :split_bills
  # has_many :users, through: :split_bills
  # accepts_nested_attributes_for :split_bills, reject_if: proc { |attributes| attributes['bill_portion'].blank? }

  validates_presence_of :total_amount, :due_date, :name, :interval, :household_id
end

