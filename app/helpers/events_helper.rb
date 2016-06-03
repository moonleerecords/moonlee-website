module EventsHelper
  # renders html for a single event
  def render_event(event)
    html = content_tag(:time, localize(event.start_date), datetime: localize(event.start_date))
    html << content_tag(:span, " @ #{event.venue.name}, #{event.venue.city} (#{event.venue.country_code})")
    html
  end
end
