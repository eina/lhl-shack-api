class Housekeeping < ActiveRecord::Base
  belongs_to :house
  validates_presence_of :household_id, :housekeeping_values
end
