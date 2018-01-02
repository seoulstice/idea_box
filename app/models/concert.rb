class Concert < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :name, presence: true, length: { in: 0..25 }
  belongs_to :user
  belongs_to :genre
  has_many :concert_images, dependent: :nullify
  has_many :images, through: :concert_images
  scope :name_like, -> (name) { where("concerts.name LIKE ?", "%#{name}%") }

  def self.per_page
    4
  end

  def time_ago
    time_ago_in_words(updated_at)
  end

  def time_until
    distance_of_time_in_words(Time.now, date)
  end

  def purchased?
    if purchased == true
      "Yes"
    else
      "No"
    end
  end

  def readable_date
    date.strftime("%A - %B %e, %Y @ %k%P")
  end
end
