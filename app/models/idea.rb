class Idea < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :idea_images, dependent: :nullify
  has_many :images, through: :idea_images
  scope :body_like, -> (body) { where("ideas.body ILIKE ?", "%#{body}") }

  def time_ago
    time_ago_in_words(updated_at)
  end
end
