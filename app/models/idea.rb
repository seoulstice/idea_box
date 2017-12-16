class Idea < ApplicatonRecord
  validates :body, presence: true
  # belongs_to :user

end
