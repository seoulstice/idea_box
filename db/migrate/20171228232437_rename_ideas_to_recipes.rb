class RenameIdeasToRecipes < ActiveRecord::Migration[5.1]
  def change
    rename_table :ideas, :recipes
  end
end
