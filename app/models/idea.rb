class Idea < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images

  def created_date_and_time
    created_at.strftime("%D %R")
  end

  def updated_date_and_time
    updated_at.strftime("%D %R")
  end
  # 
  # def create_image_assoc
  #   idea_images.create(image_id: params[:idea][:image_ids].to_i)
  # end
end
