class RemoveColumnFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :meal
  end
end
