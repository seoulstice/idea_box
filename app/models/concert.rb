class Concert < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :name, presence: true
  validates :purchased, presence: true
  belongs_to :user
  belongs_to :category
  has_many :concert_images, dependent: :nullify
  has_many :images, through: :concert_images
  scope :body_like, -> (name) { where("concerts.name LIKE ?", "%#{name}%") }

  def self.per_page
    5
  end

  def time_ago
    time_ago_in_words(updated_at)
  end
end
