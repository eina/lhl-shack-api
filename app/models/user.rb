class User < ActiveRecord::Base    
  has_many :bills, foreign_key: "user_id"
  has_many :households, foreign_key: "user_id"
  has_many :houses, through: :households, foreign_key: "user_id"
  has_many :renters, foreign_key: "user_id"
  
  validates_presence_of :first_name, :last_name, :phone_number, :email, :password
  # validates_uniqueness_of :email
  # validates_format_of :phone_number, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/
# validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i
end
