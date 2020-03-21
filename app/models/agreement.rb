class Agreement < ActiveRecord::Base
  belongs_to :houses
  validates :form_values, presence: true
end
