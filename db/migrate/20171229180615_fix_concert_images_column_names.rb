class FixConcertImagesColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :concert_images, :recipe_id, :concert_id
  end
end
