class EventsController < ApplicationController

  def new
    @event = Event.new
    @user = session[:user_id]
  end

  def create
    @event = Event.new(events_params)
    if params[:event][:event_datetime] != ""
      @event.event_datetime = DateTime.parse(params[:event][:event_datetime])
    end
    if @event.save
      EventsMailer.new_event(@event.id).deliver
      redirect_to root_path, notice: "New Event created."
    else
      render new_event_path, notice: "Event not created."
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(events_params)
    if params[:event][:event_datetime] != ""
      @event.event_datetime = DateTime.parse(params[:event][:event_datetime])
    end
    if @event.save
      redirect_to root_path
    else
      redirect_to root_path, notice: "Attempted update not successful."
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def events_params
    params.require(:event).permit(:title,  :location, :organizer, :contact_email, :description, :user_id)
  end

end
