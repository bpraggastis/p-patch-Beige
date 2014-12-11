class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :event_datetime, presence: true
  validates :organizer, presence: true
  validates :contact_email, presence: true


end
