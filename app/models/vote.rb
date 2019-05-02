class Vote < ApplicationRecord
  validates :review_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true
  validates :vote_value, presence: true, inclusion: -1..1

  belongs_to :user
  belongs_to :review
end
