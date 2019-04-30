class StopsController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @stops=Stop.all
  end

  def show
    @stop=Stop.find(params[:id])
    @review=Review.new
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

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
