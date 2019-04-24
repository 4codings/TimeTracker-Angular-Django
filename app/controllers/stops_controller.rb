class StopsController < ApplicationController
  def index
    @stops=Stop.all
  end

  def show
    @stop=Stop.find(params[:id])
  end

  def create
    new_stop = Stop.new(params[:stop])

    if new_stop.save
      flash[:notice] = "stop created successfully"

    else
      flash[:error] = "error"

    end
  end

  def new

  end

end
