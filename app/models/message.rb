class Message < ActiveRecord::Base
  belongs_to :household

  validates_presence_of :messages, :author

  scope :filter_by_household, lambda { |params|
    where({ household_id: params[:household_id] })
  }
end
