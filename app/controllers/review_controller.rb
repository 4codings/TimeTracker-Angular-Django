class ReviewController < ApplicationController

  def review_params
    params.require(:review).permit(:rating, :body, :timestamps)
  end

end
