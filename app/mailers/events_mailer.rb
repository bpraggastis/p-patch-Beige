class EventsMailer < ActionMailer::Base
  default from: "noreply@whirledpeas.com"

  def new_event(event_id)
    @users = User.all
    @event = Event.find(event_id)
    mail(to:      "noreply@whirledpeas.com",
         bcc:     "bpraggastis@gmail.com",
         subject: "#{@event.title}")
  end

end
