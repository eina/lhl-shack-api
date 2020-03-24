# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'ffaker'

# https://stackoverflow.com/questions/4894198/how-to-generate-a-random-date-in-ruby
# def time_rand from = 0.0, to = Time.now
#   Time.at(from + rand * (to.to_f - from.to_f)).to_date
# end

puts "Generating test seed..."

# @landlord = Landlord.create!(
#   first_name: "Jared",
#   last_name: "Palmer",
#   phone_number: FFaker::PhoneNumber.phone_number.to_s,
#   address: "#{FFaker::AddressCA.street_address}, #{FFaker::AddressCA.city}, #{FFaker::AddressCA.province}, #{FFaker::AddressCA.postal_code}",
#   email: FFaker::Internet.email,
#   company: FFaker::Company.name
# )

@user1 = User.create!(
  first_name: "Andy",
  last_name: "Lindsay",
  phone_number: "876-237-2519",
  email: "test@test.com",
  password: "test"
)

# @user2 = User.create!(
  # first_name: "Travis",
  # last_name: "Borsa",
  # phone_number: FFaker::PhoneNumber.phone_number.to_s,
  # email: "test2@test.com",
  # password: "test"
# )

# @house = House.create!(
#   total_rent_amt: 2000,
#   total_security_deposit_amt: 1000,
#   address: "#{FFaker::AddressCA.street_address}, #{FFaker::AddressCA.city}, #{FFaker::AddressCA.province}, #{FFaker::AddressCA.postal_code}",
#   number_of_rooms: 2,
#   number_of_bathrooms: 1,
#   pet_friendly: FFaker::Boolean.maybe,
#   smoking_allowed: FFaker::Boolean.maybe,
#   start_date: Date.parse("2019-08-01"),
#   end_date: Date.parse("2020-08-01"),
#   landlord_id: @landlord.id
# )

# @household = @user1.households.create!(
#   house_id: @house.id
# )
# @user2.households.create!(
#   house_id: @house.id
# )

# Agreement.create!(
#   household_id: @household.id,
#   is_complete: true,
#   is_expired: false,
#   form_values: "{\"rent\":{\"name\":null,\"dueDate\":\"2020-03-23T02:53:46.709Z\",\"portion\":[{\"amt_type\":{\"label\":\"$\",\"value\":\"fixed\"},\"roommate\":{\"label\":\"Andy Lindsay\",\"value\":{\"email\":\"test@test.com\",\"phone\":\"876-237-2519\",\"lastName\":\"Lindsay\",\"firstName\":\"Andy\"}},\"roommate_amt\":\"1000\"},{\"amt_type\":[],\"roommate\":{\"label\":\"Travis Borsa\",\"value\":{\"email\":\"test2@test.com\",\"phone\":\"964-545-9893\",\"lastName\":\"Borsa\",\"firstName\":\"Travis\"}},\"roommate_amt\":\"1000\"}],\"interval\":{\"label\":\"Monthly\",\"value\":\"monthly\"},\"totalAmt\":0},\"bills\":[{\"name\":\"Hydro\",\"dueDate\":\"2020-03-27T19:00:00.000Z\",\"interval\":{\"label\":\"Every 2 Months\",\"value\":\"2monthly\"},\"totalAmt\":\"120\"},{\"name\":\"Netflix\",\"dueDate\":\"2020-03-23T07:05:59.109Z\",\"interval\":{\"label\":\"Monthly\",\"value\":\"monthly\"},\"totalAmt\":\"18\",\"totalAmount\":0},{\"name\":\"Renter's Insurance\",\"dueDate\":\"2020-03-24T19:00:00.000Z\",\"interval\":{\"label\":\"Annually\",\"value\":\"annually\"},\"totalAmt\":\"500\",\"totalAmount\":0}],\"account\":{\"email\":\"\",\"last_name\":\"\",\"first_name\":\"\",\"phone_number\":\"\"},\"landlord\":{\"email\":\"landlord@landlord.com\",\"phone\":\"6041234567\",\"address\":\"123 Something Street V3M 5V3\",\"company\":\"\",\"lastName\":\"Palmer\",\"firstName\":\"Jared\"},\"household\":{\"address\":\"401 w georgia V3M 5V3\",\"rentAmt\":\"2000\",\"leaseDates\":{\"startDate\":\"2020-08-01T19:00:00.000Z\",\"endDate\":\"2021-08-01T19:00:00.000Z\"},\"bedroomsAmt\":\"3\",\"petFriendly\":true,\"bathroomsAmt\":\"1.5\",\"smokingAllowed\":false,\"securityDepositAmt\":\"1000\"},\"roommates\":[{\"email\":\"test@test.com\",\"phone\":\"876-237-2519\",\"lastName\":\"Lindsay\",\"firstName\":\"Andy\"},{\"email\":\"test2@test.com\",\"phone\":\"964-545-9893\",\"lastName\":\"Borsa\",\"firstName\":\"Travis\"}],\"signatures\":[{\"date\":\"2020-03-23T08:09:42.851Z\",\"agreed\":true,\"fullName\":\"Andy Lindsay\"},{\"date\":\"2020-03-23T08:09:42.851Z\",\"agreed\":true,\"fullName\":\"Travis Borsa\"}],\"housekeeping\":{\"weekdayAM\":\"6\",\"weekdayPM\":\"10\",\"weekendAM\":\"6\",\"weekendPM\":\"12\",\"petsPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"1ubk0\\\",\\\"text\\\":\\\"pet them\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"guestPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"8s74i\\\",\\\"text\\\":\\\"Macaroon  bonbon bear claw halvah. Oat cake bonbon chocolate cake chocolate cake  chocolate cake. Chocolate soufflé pie carrot cake chupa chups soufflé  bear claw topping. Cookie fruitcake marshmallow candy canes tiramisu  marshmallow apple pie danish.\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[{\\\"offset\\\":0,\\\"length\\\":33,\\\"style\\\":\\\"BOLD\\\"},{\\\"offset\\\":171,\\\"length\\\":29,\\\"style\\\":\\\"ITALIC\\\"},{\\\"offset\\\":223,\\\"length\\\":11,\\\"style\\\":\\\"UNDERLINE\\\"}],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"roomsPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"b7099\\\",\\\"text\\\":\\\"\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"choresPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"25m8l\\\",\\\"text\\\":\\\"\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"spacesPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"5eh4b\\\",\\\"text\\\":\\\"\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"smokingPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"1n48q\\\",\\\"text\\\":\\\"\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"messagesPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"dd3lf\\\",\\\"text\\\":\\\"carrier pigeon\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"vacationPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"7kb7n\\\",\\\"text\\\":\\\"\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\",\"personalItemsPolicy\":\"{\\\"blocks\\\":[{\\\"key\\\":\\\"867qu\\\",\\\"text\\\":\\\"\\\",\\\"type\\\":\\\"unstyled\\\",\\\"depth\\\":0,\\\"inlineStyleRanges\\\":[],\\\"entityRanges\\\":[],\\\"data\\\":{}}],\\\"entityMap\\\":{}}\"},\"securityDeposit\":{\"name\":null,\"dueDate\":\"2020-03-23T02:53:46.709Z\",\"portion\":[{\"amt_type\":[],\"roommate\":{\"label\":\"Andy Lindsay\",\"value\":{\"email\":\"test@test.com\",\"phone\":\"876-237-2519\",\"lastName\":\"Lindsay\",\"firstName\":\"Andy\"}},\"roommate_amt\":\"500\"},{\"amt_type\":[],\"roommate\":{\"label\":\"Travis Borsa\",\"value\":{\"email\":\"test2@test.com\",\"phone\":\"964-545-9893\",\"lastName\":\"Borsa\",\"firstName\":\"Travis\"}},\"roommate_amt\":\"500\"}],\"interval\":{\"label\":\"Once\",\"value\":\"once\"},\"totalAmt\":0}}"
# )

# @bill = Bill.create!(
#   household_id: @household.id,
#   total_amount: 80,
#   due_date: Date.parse("2020-04-01"),
#   name: "BC Hydro",
#   interval: "bi-monthly"
# )

# SplitBill.create!(
#   bill_id: @bill.id,
#   user_id: @user1.id,
#   bill_portion: 40
# )

# SplitBill.create!(
#   bill_id: @bill.id,
#   user_id: @user2.id,
#   bill_portion: 40
# )


puts "User records created: #{User.count}"
# puts "Landlord records created: #{Landlord.count}"
# puts "House records created: #{House.count}"
# puts "Household records created: #{Household.count}"
# puts "Agreement records created: #{Agreement.count}"
# puts "Bill records created: #{Bill.count}"
# puts "SplitBill records created: #{SplitBill.count}"
