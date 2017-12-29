class Recipe < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :recipe_images, dependent: :nullify
  has_many :images, through: :recipe_images
  scope :body_like, -> (body) { where("recipes.body LIKE ?", "%#{body}%") }

  def self.per_page
    5
  end

  def time_ago
    time_ago_in_words(updated_at)
  end
end
