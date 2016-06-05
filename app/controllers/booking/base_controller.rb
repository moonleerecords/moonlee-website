class Booking::BaseController < ApplicationController
  # layout 'booking/layouts/application'

  def upcoming_events(per_artist = 5)
    upcoming_events = Event.records.upcoming.group_by { |event| event.artist.name }
    if per_artist
      upcoming_events.each do |key, _|
        upcoming_events[key] = upcoming_events[key].slice(0, per_artist)
      end
    end
    upcoming_events
  end
end
