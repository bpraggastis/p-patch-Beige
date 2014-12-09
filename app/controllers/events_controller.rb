class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.event_datetime = DateTime.parse(params[:event][:event_datetime]) || DateTime.now

    if @event.save
      redirect_to events_path, notice: "New Event created."
    else
      render :new, notice: "Event not created."
    end
  end

  private

  def events_params
    params.require(:event).permit(:title,  :location, :organizer, :contact_email, :description, :user_id)
  end
end
