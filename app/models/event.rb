class Event < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :event_datetime, presence: true


end
