class Api::V1::StopsController < ApplicationController

  def show
    render json: Stop.find(params[:id])
  end

end
