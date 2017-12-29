class RenameRestrictionsToIngredients < ActiveRecord::Migration[5.1]
  def change
    rename_table :restrictions, :ingredients
  end
end
