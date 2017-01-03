namespace :songkick do
  desc 'Fetch upcoming events from Songkick'
  task fetch_upcoming_events: :environment do
    events_fetcher = Songkick::EventsFetcher.new

    events_fetcher.fetch_upcoming_events
  end
end
