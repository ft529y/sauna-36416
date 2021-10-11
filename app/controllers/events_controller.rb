class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create]
  before_action :check_user, only: [:show]

  def show
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.valid?
      redirect_to event_path(current_user.id)
    else
      render :new
    end
  end
end

private

def event_params
  params.require(:event).permit(:execution_id, :place, :fee, :start_time).merge(user_id: current_user.id)
end

def check_user
  @user = User.find(params[:id])
  redirect_to root_path unless current_user.id == @user.id
end
