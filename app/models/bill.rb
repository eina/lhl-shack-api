class Bill < ActiveRecord::Base
  belongs_to :households
  belongs_to :users

  # has_many :split_bills
  # has_many :users, through: :split_bills
  # accepts_nested_attributes_for :split_bills, reject_if: proc { |attributes| attributes['bill_portion'].blank? }

  validates_presence_of :total_amount, :due_date, :name, :interval, :household_id, :user_amount, :bill_uuid, :user_id

  scope :filter_bill_by_user, lambda { |params|
    where({ household_id: params[:household_id], user_id: params[:user_id] })
  }
  
  scope :filter_bill_by_household_and_bill_uuid, lambda { |params| 
    where({ household_id: params[:household_id], bill_uuid: params[:bill_uuid] })
  }

  scope :filter_unpaid_bill_due_soon, lambda { |params|        
    where("due_date >= ? AND user_status = 'unpaid' AND household_id = ? AND user_id = ?", params[:date_to_check], params[:household_id], params[:user_id]).order("due_date ASC").limit(1)
  }

  # filter bill by user & household & bill_uuid
  scope :filter_user_single_bill, lambda  { |params| 
    where({ household_id: params[:household_id], bill_uuid: params[:bill_uuid], user_id: params[:user_id] })
  }
   
end

