class EventsMailer < ActionMailer::Base
  default from: "noreply@whirledpeas.com"

  def new_event(event_id)
    # @email_users = User.all.collect do |user|
    #   user.email
    # end
    @event = Event.find(event_id)
    mail(to:      "noreply@whirledpeas.com",
         bcc:     User.all.collect{|user| user.email},
         subject: "Whirled Peas Event Announcement",
         autotext: true
         )




  end

end
