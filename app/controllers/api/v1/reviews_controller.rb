class Api::V1::ReviewsController < ApplicationController
  def create
    @stop = Stop.find(params['stop_id'])
    flattened = review_params
    # binding.pry
    @review = Review.new(
      rating: flattened["rating"],
      body: flattened["body"],
      stop_id: @stop.id,
      up_votes: 0,
      down_votes: 0,
      user_id: current_user.id
    )
    # @review.stop = @stop
    if @review.save
      render json: { stop: @stop, reviews: @stop.reviews, errors: "" }
    else
      @errors = @review.errors.full_messages.join(', ❌').prepend('❌')
      render json: { stop: @stop, reviews: @stop.reviews, errors: @errors }
    end
  end

   private
   def review_params
     params.require(:review).permit(:body, :rating)
   end
end
