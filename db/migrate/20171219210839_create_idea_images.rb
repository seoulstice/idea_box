class CreateIdeaImages < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_images do |t|
      t.references :idea, foreign_key: true
      t.references :image, foreign_key: true
    end
  end
end
