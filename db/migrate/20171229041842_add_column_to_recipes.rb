class AddColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :instruction, :string
  end
end
