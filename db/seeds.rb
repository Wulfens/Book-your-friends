# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mathieu = User.create!(email: "mail@mail.mail", password: "123456")
Animal.create!(name: "Pepito", species: "Chat", price_per_hour: 15, user: mathieu)
