class ChangeRecipeIngredientsColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipe_ingredients, :restriction_id, :ingredient_id
  end
end
