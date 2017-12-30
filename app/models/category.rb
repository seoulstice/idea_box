class Category < ApplicationRecord
  validates :classification, presence: true
  has_many :concerts, dependent: :destroy
end
