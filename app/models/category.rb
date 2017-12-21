class Category < ApplicationRecord
  validates :classification, presence: true
  has_many :ideas, dependent: :nullify
end
