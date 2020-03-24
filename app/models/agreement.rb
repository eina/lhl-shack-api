class Agreement < ActiveRecord::Base
  belongs_to :houses
  
  validates_presence_of :household_id, :form_values, :is_complete, :is_expired
end
