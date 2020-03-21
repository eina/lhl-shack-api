class Household < ActiveRecord::Base
  belongs_to :user
  belongs_to :houses
  # has_one :housekeepings
  # has_many :bills
  has_many :agreements, foreign_key: "household_id"
  # has_many :documents
end
