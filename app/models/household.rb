class Household < ActiveRecord::Base
  belongs_to :user
  belongs_to :houses
  
  has_many :agreements, foreign_key: "household_id"
  
  validates_presence_of :user_id, :house_id, :start_date, :end_date, :is_active
end
