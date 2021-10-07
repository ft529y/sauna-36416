class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create]

  def show
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.valid?
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def event_params
  params.require(:event).permit(:execution_id, :place, :fee, :start_time).merge(user_id: current_user.id)
end