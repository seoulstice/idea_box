class RenameIdeaImagesToRecipeImages < ActiveRecord::Migration[5.1]
  def change
    rename_table :idea_images, :recipe_images
  end
end
