class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def upcoming_events_by_artist(events_count = 5)
    upcoming_events = Event.upcoming.group_by {|event| event.artist.name }
    upcoming_events.each do |key, _|
      upcoming_events[key] = upcoming_events[key].slice(0, events_count)
    end
    upcoming_events
  end
end
