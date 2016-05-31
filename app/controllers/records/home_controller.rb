class Records::HomeController < Records::BaseController
  # TODO: before_filter :search_deal, :only => [:showcase, :buy_stuff, ...]
  # TODO: upcoming releases, shown on more pages, but different count

  def index
    # TODO: @latest_news = News.all

    @upcoming_releases = Release.upcoming
    @fresh_releases = Release.fresh
    @latest_releases = (Release.latest - @fresh_releases).take(5)

    @upcoming_events = upcoming_events_by_artist(5)
    # TODO: latest adds to the store
  end
end
