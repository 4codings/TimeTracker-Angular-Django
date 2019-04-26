class AdminController < ApplicationController
  before_action :authorize_user

  def reviews
    @reviews = Review.all
  end

  def delete_review
    Review.find(params[:id]).delete
  end

  private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
