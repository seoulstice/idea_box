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

GENRES.each do |genre|
  Genre.create!(classification: "#{genre}")
end

user = User.create!(password: "admin", email: "admin@gmail.com", role: 1, name: "admin")

user2 = User.create!(password: "yjj", email: "yjj@gmail.com", role: 0, name: "young")
