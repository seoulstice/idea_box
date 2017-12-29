class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates_confirmation_of :password
  has_secure_password
  has_many :concerts
  enum role: ["default", "admin"]
end
