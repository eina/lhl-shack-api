class Agreement < ActiveRecord::Base
  belongs_to :houses
  
  validates_presence_of :household_id, :form_values
  validates :is_complete, inclusion: { in: [true, false] }
  validates :is_expired, inclusion: { in: [true, false] }
end
