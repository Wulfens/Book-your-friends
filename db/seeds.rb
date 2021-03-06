require 'faker'
require "open-uri"


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

10.times do 
  user = User.new({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password 
  # city: Faker::Address.city 
  })
user.save!
end

10.times do 
file = URI.open('https://source.unsplash.com/800x450/?animal')
animal = Animal.new({
  user: User.all.sample,
  name: Faker::Creature::Cat.name.upcase,
  species: Faker::Creature::Animal.name,
  price_per_hour: Faker::Number.within(range: 1..15)
})

animal.photo.attach(io: file, filename: 'cat.webp', content_type: 'image/webp')
animal.save!
end