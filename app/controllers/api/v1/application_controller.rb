class Api::V1::ApplicationsController < ApplicationController

  def show
    stop = Stop.find(params[:stop_id])
    review = stop.reviews.find(params[:id])
    render review
    render stop
  end

end
