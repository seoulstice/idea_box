class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  # validates :image, presence: true
  has_many :recipe_images
  has_many :recipes, through: :recipe_images

end
