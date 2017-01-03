module Records
  class EventsController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def index
      @events = Event.on_records.upcoming.group_by { |event| event.artist }
      meta_tags('Shows', 'Upcoming shows from Moonlee artists')
    end
  end
end
