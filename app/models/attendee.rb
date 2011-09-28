class Attendee < ActiveRecord::Base
  has_many :events_attendees
  has_many :events, :through => :events_attendees
end
