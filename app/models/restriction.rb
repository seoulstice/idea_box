class Restriction < ApplicationRecord
  has_many :recipes, through: :recipe_restrictions


end
