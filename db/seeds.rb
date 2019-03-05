# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Item.destroy_all

20.times do |i|
	my_item = Item.create(title: Faker::Games::Pokemon.name,
												description: Faker::Creature::Cat.breed,
												price: 5.0,
												image_url: "http://127.0.0.1:3000/assets/chatons/#{i}.jpg")
end

puts "rails db:seed complete!"