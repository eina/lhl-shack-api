class Household < ActiveRecord::Base
  has_many :bills
  has_many :agreements
  has_many :documents
end
