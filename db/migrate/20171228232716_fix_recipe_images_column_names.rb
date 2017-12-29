class FixRecipeImagesColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipe_images, :idea_id, :recipe_id
  end
end
