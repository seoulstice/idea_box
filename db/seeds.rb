Category.destroy_all
Restriction.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CATEGORIES = ["Breakfast", "Lunch", "Dinner", "Snack", ]
INGREDIENTS = ["Chicken", "Beef", "Tofu", "Lettuce", "Atkins"]

CATEGORIES.each do |category|
  Category.create!(classification: "#{category}")
end

INGREDIENTS.each do |ingredient|
  Ingredient.create!(body: "#{ingredient}")
end
