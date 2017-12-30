class RenameRecipesToConcerts < ActiveRecord::Migration[5.1]
  def change
    rename_table :recipes, :concerts
  end
end
