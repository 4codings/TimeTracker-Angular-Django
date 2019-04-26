class ReviewsController < ApplicationController

  def create
    @stop = Stop.find(params[:stop_id])
    @review = Review.new(review_params)
    @review.stop = @stop
    binding.pry
  if @review.save
    flash[:notice] = "Review saved successfully."
    redirect_to stop_path(@stop)
   else

    flash[:errors] = @review.errors.full_messages.join(', ')
    @id = @stop.id
    redirect_to stop_path(@stop)
   end
 end

 private

 def review_params
   params.require(:review).permit(:body, :rating)
 end
end
