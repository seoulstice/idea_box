class RenameCategoriesToGenres < ActiveRecord::Migration[5.1]
  def change
    rename_table :categories, :genres
  end
end
