require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "test@hotmal.fr", password: "cat123", first_name: "Jean" ,last_name: "Dog")
20.times do 
  Animal.create([{
    user: User.first,
    name: Faker::Creature::Cat.name,
    species: Faker::Creature::Animal.name,
    price_per_hour: Faker::Number.within(range: 1..15)
  }])
end