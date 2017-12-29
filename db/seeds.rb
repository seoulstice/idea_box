Category.destroy_all
Image.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES = ["Rock", "Hip-Hop", "EDM", "DJ", "Pop", "Country"]
IMAGES = [

         ]

CATEGORIES.each do |category|
  Category.create!(classification: "#{category}")
end

# IMAGES.each do |image, name|
#   Image.create!(image: File.open(Rails.root + "app/assets/images/food/#{image}"), name: "#{name}")
# end

user = User.create!(password: "admin", email: "admin@gmail.com", role: 1, name: "admin")
