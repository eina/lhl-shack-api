class Household < ActiveRecord::Base
  belongs_to :user
  belongs_to :house
  
  has_many :bills, foreign_key: "household_id"
  has_many :agreements, foreign_key: "household_id"
  
  validates_presence_of :user_id, :house_id

  scope :filter_households_by_house, lambda { |params| 
    where({ house: params[:house_id] })
  }

  scope :filter_household_by_house_and_user, lambda { |params|
    where({ house_id: params[:house_id], user_id: params[:user_id] })
  }
end
