class ReviewController < ApplicationController

  def new
    @review=Review.new
  end


  def create
    @review=Review.new(review_params)
  end

  def review_params
   params.require(:review).permit(:rating, :body, :timestamps)
 end
 
end
