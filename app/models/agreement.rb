class Agreement < ActiveRecord::Base
  belongs_to :houses
  validates :form_values, presence: true
  validates_presence_of :house_id
end
