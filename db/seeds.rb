require 'faker'
require "open-uri"

file = URI.open('https://images.unsplash.com/photo-1574158622682-e40e69881006?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1700&q=80')

User.destroy_all
Animal.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "test@hotmal.fr", password: "cat123", first_name: "Jean" ,last_name: "Dog")
User.create(email: "user2@hotmail.fr", password: "cat123", first_name: "Hot" ,last_name: "Dog") 

animal = Animal.new({
  user: User.first,
  name: Faker::Creature::Cat.name.upcase,
  species: Faker::Creature::Animal.name,
  price_per_hour: Faker::Number.within(range: 1..15)
})

animal.photo.attach(io: file, filename: 'cat.webp', content_type: 'image/webp')
animal.save!
