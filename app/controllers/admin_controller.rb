class AdminController < ApplicationController
  before_action :authorize_user

  def reviews
    @reviews = Review.all
  end

  def delete_review
    if Review.find(params[:id]).delete
      flash[:notice] = "Review deleted"
      redirect_to '/admin/reviews'
    else
      flash.now[:error] = Review.errors.full_messages.join(", ")
      render action: :reviews
    end
  end

  private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
