class Household < ActiveRecord::Base
  belongs_to :user
  belongs_to :houses
end
