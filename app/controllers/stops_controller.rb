class StopsController < ApplicationController

  def index
    @stops=Stop.all
  end

  def show
    render "static_views/index"
  end

  def new
    @stop = Stop.new
  end

  def create
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:notice] = "stop created successfully"
      redirect_to @stop
    else
      flash.now[:error] = @stop.errors.full_messages.join(", ")
      render action: :new
    end
  end

  private
  def stop_params
    params.require(:stop).permit(:name)
  end

end
