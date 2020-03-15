# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# test for households
Agreement.create!(form_values: "{\"test\":\"hi\"}", is_complete: false, is_expired: false)

puts "Agreement Count: #{Agreement.all.count}"
puts "Created: #{Agreement.order("created_at").last}"