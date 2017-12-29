class RenameRecipesColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :body, :name
  end
end
