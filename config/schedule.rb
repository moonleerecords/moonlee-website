# set :output, "/path/to/my/cron_log.log"

every 12.hours do
  runner 'Fetch upcoming events from Songkick'
  rake 'songkick:fetch_upcoming_events'
end
