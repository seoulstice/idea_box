class RecipeRestriction < ApplicationRecord
  belongs_to :recipe
  belongs_to :restriction
end
