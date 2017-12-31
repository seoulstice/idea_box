class RenameColumnOnConcerts < ActiveRecord::Migration[5.1]
  def change
    rename_column :concerts, :category_id, :genre_id 
  end
end
