module EventsHelper
  # renders html for a single event
  def render_event(event)
    html = content_tag(:time, event.start_date.strftime('%m.%d.%Y'), datetime: event.start_date)
    html << content_tag(:span, " @ #{event.venue.name}, #{event.venue.city} (#{event.venue.country_code})")
    html
  end
end
