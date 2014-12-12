class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :event_datetime, presence: true
  validates :organizer, presence: true
  validates :contact_email, presence: true

  def self.entries(date)

    events = Event.all.select do |event|
      event.event_datetime.strftime("%b %-d, %Y") == date.strftime("%b %-d, %Y")
   end

    entries = events.collect do |event|
      "#{event.title}: #{event.event_datetime.strftime("%I:%M %P")}"
    end
    return entries.join(" ")
  end
end
