# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)user.name = "Alex"
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

Plant.create!(
  address: "10 rue la noue croix de fer, 44000, NANTES",
  name: "tulipe",
  category: "fleur",
  price_per_day: 2,
  description: "belle plante colorée",
  orientation: "nord",
  sun: "ombre",
  user: User.find_by(email:"maelle@mail.com")
)

Booking.create!(
  start_date: DateTime.now,
  end_date: DateTime.tomorrow,
  total_price: 2,
  user: User.find_by(email:"ben@mail.com"),
  plant: Plant.find_by(name:"tulipe")
)
