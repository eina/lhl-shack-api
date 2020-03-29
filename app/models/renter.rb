class Renter < ActiveRecord::Base
  belongs_to :user
  belongs_to :household

  validates_presence_of :household_id, :user_id

  scope :filter_by_household, lambda { |params| 
    where({ household_id: params[:household_id] })
  }
end
