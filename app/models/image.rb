class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :concert_images
  has_many :concerts, through: :concert_images, dependent: :destroy

  def self.per_page
    10
  end
end
