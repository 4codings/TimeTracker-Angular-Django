class Api::V1::StopsController < ApplicationController

  def show

    @stop = Stop.find(params[:id])
    @review = @stop.reviews
    response = { :stop => @stop, :reviews => @review }
    render :json => response

  end

end
