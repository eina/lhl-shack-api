class Landlord < ActiveRecord::Base
  has_many :households
end
