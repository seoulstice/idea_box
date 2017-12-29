class RenameRecipeRestrictionsToRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    rename_table :recipe_restrictions, :recipe_ingredients
  end
end
