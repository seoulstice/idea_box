class ConcertImage < ApplicationRecord
  belongs_to :concert
  belongs_to :image
end
