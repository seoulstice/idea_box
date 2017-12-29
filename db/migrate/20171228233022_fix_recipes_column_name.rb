class FixRecipesColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :term, :meal
  end
end
