class RenameRecipeImagesToConcertImages < ActiveRecord::Migration[5.1]
  def change
    rename_table :recipe_images, :concert_images
  end
end
