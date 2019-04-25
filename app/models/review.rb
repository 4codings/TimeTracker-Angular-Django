class Review < ApplicationRecord
  belongs_to :stop

  validates :rating, presence: true, :inclusion => 1..5
  validates :body, presence: true

end
