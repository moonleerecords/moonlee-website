module Booking
  class BaseController < ApplicationController
    # layout 'booking/layouts/application'

    def upcoming_events(limit = nil)
      @upcoming_events = Event.on_booking.upcoming.limit(limit)
    end

    def upcoming_events_per_artist(limit = nil)
      @upcoming_events = Event.on_booking.upcoming.group_by { |event| event.artist.name }
      if limit
        @upcoming_events.each do |key, _|
          @upcoming_events[key] = @upcoming_events[key].slice(0, limit)
        end
      end
      @upcoming_events
    end
  end
end
