class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    raise params.inspect
  end

  private

  def events_params
    params.require(:event).permit(:title, :event_datetime, :location, :organizer, :contact_email, :description, :user_id)
  end
end
