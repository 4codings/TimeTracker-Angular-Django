class Review < ApplicationRecord
  belongs_to :stop
  has_many :votes

  validates :rating, presence: true, inclusion: 1..5
  validates :body, presence: true
  validates :user_id, presence: true

end
