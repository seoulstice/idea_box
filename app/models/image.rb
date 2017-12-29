class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :recipe_images
  has_many :recipes, through: :recipe_images

end
