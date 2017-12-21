class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  # validates :image, presence: true
  has_many :idea_images
  has_many :ideas, through: :idea_images

end
