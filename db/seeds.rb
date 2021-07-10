# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)user.name = "Alex"
require "open-uri"

Booking.destroy_all
Plant.destroy_all
User.destroy_all

user = User.new(
  name: "Alex",
  email: "alex@mail.com"
)
user.password = "123456789"
user.save!

user = User.new(
  name: "Maelle",
  email: "maelle@mail.com"
)
user.password = "123456789"
user.save!

user = User.new(
  name: "Ben",
  email: "ben@mail.com"
)
user.password = "123456789"
user.save!

plant = Plant.new(
  address: "10 rue la noue croix de fer, 44000, NANTES",
  name: "Tulip",
  category: "Flower",
  price_per_day: 2,
  description: "Beautiful colored plant",
  orientation: "North",
  sun:"ombre",
  user: User.find_by(email:"maelle@mail.com")
)
file = URI.open("https://www.meillandrichardier.com/media/catalog/product/cache/1/image/800x800/040ec09b1e35df139433887a97daa66f/4/2/4225-tulipe_darwin_silver_stream-t1000.jpg")
plant.photo.attach(io: file, filename: "tulipe.png", content_type: "image/png")
plant.save!

plant = Plant.new(
  address: "10 passage de la poule noire, 44000, NANTES",
  name: "Cactus",
  category: "Cactées",
  price_per_day: 3,
  description: "Plant",
  orientation: "South",
  sun:"ensoleille",
  user: User.find_by(email:"ben@mail.com")
)
file = URI.open("https://media.istockphoto.com/photos/small-castus-in-a-pot-on-a-white-background-picture-id492056805")
plant.photo.attach(io: file, filename: "cactus.png", content_type: "image/png")
plant.save!

Booking.create!(
  start_date: DateTime.now,
  end_date: DateTime.tomorrow,
  total_price: 2,
  user: User.find_by(email:"ben@mail.com"),
  plant: Plant.find_by(name:"Tulip")
)
