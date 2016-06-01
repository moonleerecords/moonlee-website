class Booking::BaseController < ApplicationController
  # layout 'booking/layouts/application'

  def upcoming_events(events_count = 5)
    upcoming_events = Event.records.upcoming.group_by { |event| event.artist.name }
    upcoming_events.each do |key, _|
      upcoming_events[key] = upcoming_events[key].slice(0, events_count)
    end
    upcoming_events
  end
end
