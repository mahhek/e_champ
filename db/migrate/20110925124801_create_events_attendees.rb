class CreateEventsAttendees < ActiveRecord::Migration
  def self.up
    create_table :events_attendees do |t|
      t.integer :attendee_id
      t.integer :event_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :events_attendees
  end
end
