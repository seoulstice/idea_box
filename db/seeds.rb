Genre.destroy_all
Image.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GENRES = ["Rock", "Hip-Hop", "Electronica", "DJ", "Pop", "Jazz", "Blues", "R&B"]
IMAGES = [["alinabaraz.jpg", "Alina Baraz"],
          ["childishgambino.jpg", "Childish Gambino"],
          ["djtennis.jpg", "DJ Tennis"],
          ["drake.jpg", "Drake"],
          ["fourtet.jpg", "Four Tet"],
          ["gogopenguin.jpg", "Gogo Penguin"],
          ["jdilla.jpg", "J Dilla"],
          ["kendrick.jpg", "Kendrick Lamar"],
          ["nosaj.jpg", "Nosaj Thing"],
          ["tashsultana.jpeg", "Tash Sultana"],
          ["tokimonsta.jpg", "TOKiMONSTA"],
          ["tycho.jpg", "Tycho"],
          ]

GENRES.each do |genre|
  Genre.create!(classification: "#{genre}")
end

IMAGES.each do |image, name|
  Image.create!(image: File.open(Rails.root + "app/assets/images/artists/#{image}"), name: "#{name}")
end

user = User.create!(password: "admin", email: "admin@gmail.com", role: 1, name: "admin")

user2 = User.create!(password: "yjj", email: "yjj@gmail.com", role: 0, name: "young")


user.concerts.create!(name: "Tash Sultana", user_id: 1, created_at: Time.now, updated_at: Time.now, genre_id: 1, purchased: true, date: Time.now, image_ids: [10] )
user.concerts.create!(name: "TOKiMONSTA", user_id: 1, created_at: Time.now, updated_at: Time.now, genre_id: 3, purchased: false, date: Time.now, image_ids: [11] )
user.concerts.create!(name: "Tycho", user_id: 1, created_at: Time.now, updated_at: Time.now, genre_id: 3, purchased: true, date: Time.now, image_ids: [12] )
user.concerts.create!(name: "Kendrick Lamar", user_id: 1, created_at: Time.now, updated_at: Time.now, genre_id: 2, purchased: true, date: Time.now, image_ids: [8] )
user.concerts.create!(name: "Alina Baraz", user_id: 1, created_at: Time.now, updated_at: Time.now, genre_id: 5, purchased: true, date: Time.now, image_ids: [1] )
user.concerts.create!(name: "Childish Gambino", user_id: 1, created_at: Time.now, updated_at: Time.now, genre_id: 2, purchased: true, date: Time.now, image_ids: [2] )
