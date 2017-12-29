class Restriction < ApplicationRecord
  validates :body, presence: true
  has_many :recipe_restrictions
  has_many :recipes, through: :recipe_restrictions


end
