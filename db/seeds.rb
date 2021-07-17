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
  address: "rue des Pins, 29120 Pont l'Abbé",
  name: "Purple basil",
  category: "Aromatics",
  price_per_day: 2,
  description: "These purple basil leaves have a beautiful, coppery glow and clove-like, slightly spicy flavor. Use them in salads or preserved in oils and vinegars. A pot of purple basil provides surprisingly, striking color in the garden.",
  orientation: "South",
  sun:"Sunny",
  user: User.find_by(email:"maelle@mail.com")
)
file = URI.open("https://www.veritable-garden.com/196-large_default/organic-purple-basil-lingot.jpg")
plant.photo.attach(io: file, filename: "purple-basil.png", content_type: "image/png")
plant.save!

plant = Plant.new(
  address: " 4 rue Jeanne d'Arc, 44000, NANTES",
  name: "Prickly pear",
  category: "Easy-maintenance",
  price_per_day: 3,
  description: "The prickly pear is a species of plant of the Cactaceae family, native to Mexico, which has naturalized in other continents, including the Mediterranean basin and in South Africa and North Africa. It is one of the two species producing the edible fruit called prickly pear",
  orientation: "South",
  sun:"Sunny",
  user: User.find_by(email:"ben@mail.com")
)
file = URI.open("https://weledaint-prod.global.ssl.fastly.net/binaries/content/gallery/global/magazine-header-images/articles/beauty/hd_pricklypear.jpg/hd_pricklypear.jpg/magazine%3Axxl")
plant.photo.attach(io: file, filename: "prickly-pear.png", content_type: "image/png")
plant.save!

plant = Plant.new(
  address: "10 passage de la poule noire, 44000, NANTES",
  name: "Tayberries",
  category: "Small fruits",
  price_per_day: 3,
  description: "Tayberries are born from the marriage of raspberries and blackberries, which gives them a fruity and acid taste. ... It is also called raspberry bramble ... It is a very juicy fruit with a rather harsh taste, rich in vitamin A, calcium and potassium.",
  orientation: "South",
  sun:"Sunny",
  user: User.find_by(email:"alex@mail.com")
)
file = URI.open("https://www.jacques-briant.fr/4508-large_default/medana-tayberry.jpg")
plant.photo.attach(io: file, filename: "tayberry.png", content_type: "image/png")
plant.save!

plant = Plant.new(
  address: "1bis Rue des Dervallières, 44000 Nantes",
  name: "Borage",
  category: "Comestible flowers",
  price_per_day: 2,
  description: "",
  orientation: "South",
  sun:"Sunny",
  user: User.find_by(email:"alex@mail.com")
)
file = URI.open("https://www.gardeningknowhow.com/wp-content/uploads/2011/07/borage-1.jpg")
plant.photo.attach(io: file, filename: "Borage.png", content_type: "image/png")
plant.save!

plant = Plant.new(
  address: "12 Rue Voltaire, 44000 Nantes",
  name: "Desmodium",
  category: "Healthy",
  price_per_day: 4,
  description: "Native to Equatorial Africa, Desmodium has only recently become known in Europe. This plant acts as an excellent hepatoprotector when the liver is attacked.",
  orientation: "South",
  sun:"Sunny",
  user: User.find_by(email:"maelle@mail.com")
)
file = URI.open("https://media.laboratoire-lescuyer.com/media/magefan_blog/Desmodium.png")
plant.photo.attach(io: file, filename: "Desmodium.png", content_type: "image/png")
plant.save!

plant = Plant.new(
  address: "3 Boulevard Gaston Serpette, 44000 Nantes",
  name: "Vegetal Wall",
  category: "Decoration",
  price_per_day: 4,
  description: "Plant decoration board - Finnish foam stabilized and 100% natural - White square frame",
  orientation: "Est",
  sun:"Whatever",
  user: User.find_by(email:"ben@mail.com")
)
file = URI.open("https://raja.scene7.com/is/image/Raja/products/tableau-vegetal-decoration-mousse-finlande-stabilisee-100-naturelle-cadre-carre-blanc_67011-00J.jpg?image=asset7013101$nextpdt$")
plant.photo.attach(io: file, filename: "vegetal-wall.png", content_type: "image/png")
plant.save!

Booking.create!(
  start_date: DateTime.now,
  end_date: DateTime.tomorrow,
  total_price: 3,
  user: User.find_by(email:"ben@mail.com"),
  plant: Plant.find_by(name:"Prickly pear")
)
