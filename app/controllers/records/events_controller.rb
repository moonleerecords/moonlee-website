class Records::EventsController < Records::BaseController
  before_action do
    promoted_releases(3)
    upcoming_events(5)
  end

  def index
    @events = Event.records.upcoming.group_by { |event| event.artist.name }
  end

  def show
    @event = Event.find(params[:id])
  end
end
