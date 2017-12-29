class Category < ApplicationRecord
  validates :classification, presence: true
  has_many :recipes, dependent: :destroy
end
