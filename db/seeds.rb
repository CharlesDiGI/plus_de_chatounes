# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Item.destroy_all
Category.destroy_all

kitty = Category.create!(name: "Kitty")
kibble = Category.create!(name: "Kibble")

20.times do |i|
	item = Item.create!(
					title: Faker::Games::Pokemon.name,
					description: Faker::Lorem.paragraph_by_chars(60, false),
					price: rand(1..12),
					category: Category.find_by(name: "Kitty"))
	item.image.attach(io: File.open("app/assets/images/chatons/#{i}.jpg"), filename: "#{i}.jpg")

end

5.times do |i|
	item = Item.create!(
					title: Faker::Games::Pokemon.name,
					description: Faker::Lorem.paragraph_by_chars(60, false),
					price: rand(1..12),
					category: Category.find_by(name: "Kibble"))
	item.image.attach(io: File.open("app/assets/images/chatons/#{i+30}.jpg"), filename: "#{i+30}.jpg")

end

puts "rails db:seed complete!"