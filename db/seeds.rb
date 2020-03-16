# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

# https://stackoverflow.com/questions/4894198/how-to-generate-a-random-date-in-ruby
def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f)).to_date
end

10.times do
  rand_start_date = time_rand Time.local(2018, 1, 1)
  rand_bill_due_date = time_rand Time.local(2020, 1, 1)

  @landlord = Landlord.create!(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    phone_number: FFaker::PhoneNumber.phone_number.to_s,
    address: "#{FFaker::AddressCA.street_address}, #{FFaker::AddressCA.city}, #{FFaker::AddressCA.province}, #{FFaker::AddressCA.postal_code}",
    email: FFaker::Internet.email,
    company: FFaker::Company.name
  )

  @user = User.create!(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    phone_number: FFaker::PhoneNumber.phone_number.to_s,
    email: FFaker::Internet.email,
    password: FFaker::Internet.password
  )

  @household = Household.create(
    total_rent_amt: rand(1234..10000),
    total_security_deposit_amt: rand(1234..10000),
    address: "#{FFaker::AddressCA.street_address}, #{FFaker::AddressCA.city}, #{FFaker::AddressCA.province}, #{FFaker::AddressCA.postal_code}",
    number_of_rooms: rand(3..10),
    number_of_bathrooms: rand(3..10),
    pet_friendly: FFaker::Boolean.maybe,
    smoking_allowed: FFaker::Boolean.maybe,
    start_date: rand_start_date, 
    end_date: rand_start_date.next_year - 1.day,
    landlord_id: @landlord.id,
    user_id: @user.id
  )

  Agreement.create(
    household_id: @household.id,
    form_values: "{\"test\":\"#{FFaker::Lorem.phrase}\"}",
    is_complete: FFaker::Boolean.maybe,
    is_expired: FFaker::Boolean.maybe
  )

  @bill = Bill.create(
    household_id: @household.id,
    total_amount: rand(5..800),
    due_date: rand_bill_due_date,
    name: FFaker::Movie.title,
    interval: rand(30..60)
  )

  SplitBill.create(
    bill_id: @bill.id,
    user_id: @user.id,
    bill_portion: rand(5..800)
  )
end

puts "User records created: #{User.count}"
puts "Landlord records created: #{Landlord.count}"
puts "Household records created: #{Household.count}"
puts "Agreement records created: #{Agreement.count}"
puts "Bill records created: #{Bill.count}"
puts "SplitBill records created: #{SplitBill.count}"
