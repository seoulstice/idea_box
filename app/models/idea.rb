class Idea < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :idea_images, dependent: :nullify
  has_many :images, through: :idea_images

  def self.per_page
    5
  end

  def created_date_and_time
    created_at.strftime("%D %R")
  end

  def updated_date_and_time
    updated_at.strftime("%D %R")
  end
end
