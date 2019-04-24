class Review < ApplicationRecord
  belongs_to :stop
  
  validates :rating, presence:true
  validates :body, presence:true

end
