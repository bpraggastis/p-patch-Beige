class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :event_datetime, presence: true
  validates :organizer, presence: true
  validates :contact_email, presence: true

  def self.entries(date)
    ddate = Date.parse(date)
    events = Event.where(event_datetime: ddate).collect do |event|
      event.title event.event_datetime.strftime("%I:%M %P")
    end
    events
  end
end
