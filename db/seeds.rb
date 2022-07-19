# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
10.times do |i|
  email = Faker::Internet.email
  password = Faker::String.random(length: 8)
  i = User.create(email: email, password: password)
  id = i.id
  name = Faker::Name.unique.name
  description = Faker::Quote.jack_handey
  category = Faker::Team.sport
  integer = Faker::Number.decimal_part(digits: 2)
  boolean = Faker::Boolean.boolean
  EquipmentListing.create(name: name, description: description, category: category, hourly_rate: integer, available: boolean, user_id: id)
end
