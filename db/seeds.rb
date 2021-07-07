# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)user.name = "Alex"

User.create(
  name: "Alex",
  email: "alex@mail.com",
  password: "123456789"
)


User.create(
  name: "Maelle",
  email: "maelle@mail.com",
  password: "123456789"
)

User.create(
  name: "Ben",
  email: "ben@mail.com",
  password: "123456789"
)

Plant.create(
  address: "10 rue la noue croix de fer, 44000, NANTES",
  name: "tulipe",
  category: "fleur",
  price_per_day: 2,
  description: "belle plante colorée",
  orientation: "nord",
  sun: "ombre"
)

Booking.create(
  start_date: DateTime.now,
  end_date: DateTime.tomorrow,
  total_price: 2
)
