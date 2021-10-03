class EventsController < ApplicationController
  def show
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_parameter)
    if @event.save?
      redirect_to root_path
    end
  end
end

private

def event_parameter
end