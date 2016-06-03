class Records::BaseController < ApplicationController
  layout 'records/layouts/application'

  def upcoming_events(per_artist = 5)
    @upcoming_events = Event.records.upcoming.group_by { |event| event.artist.name }
    @upcoming_events.each do |key, _|
      @upcoming_events[key] = @upcoming_events[key].slice(0, per_artist)
    end
  end

  def promoted_releases(latest_count = 5)
    @upcoming_releases = Release.upcoming
    @fresh_releases = Release.fresh
    @latest_releases = (Release.latest - @fresh_releases).take(latest_count)
  end
end
