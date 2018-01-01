class Genre < ApplicationRecord
  validates :classification, presence: true
  has_many :concerts, dependent: :destroy

  def self.per_page
    10
  end
end
