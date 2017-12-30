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

CATEGORIES = ["Rock", "Hip-Hop", "Electronica", "DJ", "Pop", "Jazz", "Blues", "R&B"]
IMAGES = [["alinabaraz.jpg", "Alina Baraz"],
          ["childishgambino.jpg", "Childish Gambino"],
          ["djtennis.jpg", "DJ Tennis"],
          ["drake.jpg", "Drake"],
          ["fourtet.jpg", "Four Tet"],
          ["gogopenguin.jpg", "Gogo Penguin"],
          ["jdilla.jpg", "J Dilla"],
          ["kendrick.jpg", "Kendrick Lamar"],
          ["nosaj.jpg", "Nosaj Thing"],
          ["tashsultana.jpg", "Tash Sultana"],
          ["tokimonsta.jpg", "TOKiMONSTA"],
          ["tycho.jpg", "Tycho"],
          ]

CATEGORIES.each do |category|
  Category.create!(classification: "#{category}")
end

IMAGES.each do |image, name|
  Image.create!(image: File.open(Rails.root + "app/assets/images/artists/#{image}"), name: "#{name}")
end

user = User.create!(password: "admin", email: "admin@gmail.com", role: 1, name: "admin")

user2 = User.create!(password: "yjj", email: "yjj@gmail.com", role: 0, name: "young")
