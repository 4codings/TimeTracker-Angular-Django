class Vote < ApplicationRecord
  validates :review_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true

  belongs_to :user
  belongs_to :review 
end
