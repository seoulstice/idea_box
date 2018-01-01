class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :concert_images
  has_many :concerts, through: :concert_images, dependent: :destroy
  # has_attached_file :image, :styles => { medium: "300x300", thumb: "100x100#" },
  #                   :url => ":s3_domain_url",
  #                   :path => "public/avatars/:id/:style_:basename.:extension",
  #                   :storage => :fog,
  #                   :fog_credentials => {
  #                                       provider: "AWS",
  #                                       aws_access_key_id: ENV["AWSAccessKeyId"],
  #                                       aws_secret_access_key: ENV["AWSSecretKey"],
  #                                       },
  #                   fog_directory: ENV["FOG-DIRECTORY"]

  def self.per_page
    10
  end
end
