module EventsHelper
  def event_location(event)
    "@ #{event.venue.name}, #{event.venue.city} (#{event.venue.country_code})"
  end
end
