class Api::V1::ReviewsController < ApplicationController
  def create
    @stop = Stop.find(params['stop_id'])
    @review = Review.new(review_params)
    @review.stop = @stop
    if @review.save
      render json: { stop: @stop, reviews: @stop.reviews, errors: "" }
    else
      @errors = @review.errors.full_messages.join(', ')
      render json: { stop: @stop, reviews: @stop.reviews, errors: @errors }
    end
  end

   private
   def review_params
     params.require(:review).permit(:body, :rating)
   end
end
