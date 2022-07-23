# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
EquipmentListing.destroy_all
User.destroy_all


require 'faker'

10.times do
  category = ["indoors", "outdoors", "winter"]
  User.create!(
    email: Faker::Internet.email,
    password: Faker::String.random(length: 8)
  ).equipment_listings.create!(
    name: Faker::Name.unique.name,
    description: Faker::Quote.jack_handey,
    category: category.sample,
    hourly_rate: Faker::Number.decimal_part(digits: 2),
    available: true,
    user_id: User.last.id,
    address: Faker::Address.full_address
  )
end
