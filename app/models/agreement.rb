class Agreement < ActiveRecord::Base
  belongs_to :households
  validates :form_values, presence: true
end
