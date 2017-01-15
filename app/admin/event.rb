ActiveAdmin.register Event do
  menu false

  collection_action :fetch_upcoming_shows, method: :get do
    events_fetcher = Songkick::EventsFetcher.new

    events_fetcher.fetch_upcoming_events

    redirect_to :back, notice: 'Shows imported successfully!'
  end
end
