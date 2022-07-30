# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Booking.destroy_all
puts "getting rid of all bookings..."

EquipmentListing.destroy_all
puts "getting rid of all bookings..."

User.destroy_all
puts "getting rid of all users..."

puts "Adding smarter seeds"

CATEGORY = [
  'Archery',
  'Ball & Net',
  'Bat & Ball',
  'Board',
  'Climbing',
  'Cycling',
  'Combat',
  'Snow Sports',
  'Aquatic Sports',
  'Others'
]

if EquipmentListing.count.zero?

  user1 = User.create!(
    email: Faker::Internet.email,
    password: Faker::String.random(length: 8)
  )

  listing1 = user1.equipment_listings.create!(
    name: "Wilson tennis racket",
    description: "This racket was used by Novak Djokovic during his first grand slam in 2018. It's pretty old but hey it was once used by Djokovic",
    category: "Ball & Net",
    hourly_rate: 100,
    available: true,
    user_id: User.last.id,
    address: "Meguro, Tokyo"
  )
  file1 = URI.open('https://images.unsplash.com/photo-1617883861744-13b534e3b928?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80')
  listing1.photo.attach(io: file1, filename: 'user.png', content_type: 'image/png')

  user2 = User.create!(
    email: Faker::Internet.email,
    password: Faker::String.random(length: 8)
  )
  listing2 = user2.equipment_listings.create!(
    name: "Perfect Beach Volley Kit",
    description: "volleyball balls, shorts, shoes (if you think you need them),  net and poles, and penalty cards, comes with a free whistle",
    category: "Ball & Net",
    hourly_rate: 30,
    available: true,
    user_id: User.last.id,
    address: "Yokohama"
  )
  file2 = URI.open('https://images.unsplash.com/photo-1592656094267-764a45160876?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80')
  listing2.photo.attach(io: file2, filename: 'user.png', content_type: 'image/png')

  user3 = User.create!(
    email: Faker::Internet.email,
    password: Faker::String.random(length: 8)
  )
  listing3 = user3. equipment_listings.create!(
    name: "Table tennis kit",
    description: "Set of 4 red, black ping pong paddles and 3 white balls is designed for fun with family and friends.",
    category: "Ball & Net",
    hourly_rate: 30,
    available: true,
    user_id: User.last.id,
    address: "Hachioji"
  )
  file3 = URI.open('https://images.unsplash.com/photo-1611251135345-18c56206b863?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80')
  listing3.photo.attach(io: file3, filename: 'user.png', content_type: 'image/png')


  user4 = User.create!(
    email: Faker::Internet.email,
    password: Faker::String.random(length: 8)
  )
  listing4 = user4.equipment_listings.create!(
    name: "The Best Basketball shoes",
    description: "These shoes are very light and comfortable. They have spongy cushioning, rubber outsole for traction, and supple leather upper to keep the top of your foot dry and warm.",
    category: "Ball & Net",
    hourly_rate: 20,
    available: true,
    user_id: User.last.id,
    address: "Shibuya, Tokyo"
  )
  file4 = URI.open('https://images.unsplash.com/photo-1514989940723-e8e51635b782?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80')
  listing4.photo.attach(io: file4, filename: 'user.png', content_type: 'image/png')


# User.create!(
#   email: Faker::Internet.email,
#   password: Faker::String.random(length: 8)
# ).equipment_listings.create!(
#   name: "Beginner-friendly Surfboard",
#   description: "For beginner surfers, this 8 foot foam longboard surfboard is the best. This is a foam surfboard is stable, user-friendly, and easy to paddle which makes catching waves and standing up a lot easier.",
#   category: "Aquatic Sports",
#   hourly_rate: 30,
#   available: true,
#   user_id: User.last.id,
#   address: "Enoshima"
# )

# User.create!(
#   email: Faker::Internet.email,
#   password: Faker::String.random(length: 8)
# ).equipment_listings.create!(
#   name: "2 pairs of roller blades",
#   description: "5 year old roller blades but good as new. I know what you're thinking. We aren't in the 80s or 90s. Who would want to rollerblade? But hey did you know rollerblading is one of the most efficient cardiovascular activities you can do in terms of burning the most calories? Try it!",
#   category: "Others",
#   hourly_rate: 10,
#   available: true,
#   user_id: User.last.id,
#   address: "Shinjuku"
# )

# User.create!(
#   email: Faker::Internet.email,
#   password: Faker::String.random(length: 8)
# ).equipment_listings.create!(
#   name: "Snowboard",
#   description: "All-mountain snowboard designed to work well in all snow conditions and terrain. If you’re just getting started or are unsure of exactly what you need, this all-mountain snowboard is a great choice.",
#   category: "Snow Sports",
#   hourly_rate: 20,
#   available: true,
#   user_id: User.last.id,
#   address: "Sapporo"
# )

# User.create!(
#   email: Faker::Internet.email,
#   password: Faker::String.random(length: 8)
# ).equipment_listings.create!(
#   name: "Table tennis set",
#   description: "Set of 4 red, black ping pong paddles and 3 white balls is designed for fun with family and friends.",
#   category: "Ball & Net",
#   hourly_rate: 30,
#   available: true,
#   user_id: User.last.id,
#   address: "Hachioji"
# )

# User.create!(
#   email: Faker::Internet.email,
#   password: Faker::String.random(length: 8)
# ).equipment_listings.create!(
#   name: "Table tennis set",
#   description: "Set of 4 red, black ping pong paddles and 3 white balls is designed for fun with family and friends.",
#   category: "Ball & Net",
#   hourly_rate: 30,
#   available: true,
#   user_id: User.last.id,
#   address: "Hachioji"
# )

end

puts "Done!"
