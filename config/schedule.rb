set :output, '/var/log/cron_log.log'

every 12.hours do
  runner 'Fetch upcoming events from Songkick'
  rake 'songkick:fetch_upcoming_events'
end

every 6.hours do
  runner 'Fetch images from Instagram'
  rake 'social:fetch_instagram'
end

every 6.hours do
  runner 'Fetch videos from Youtube'
  rake 'social:fetch_youtube'
end
