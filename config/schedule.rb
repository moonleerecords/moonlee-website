set :output, '/var/log/cron_log.log'

every 1.hour do
  runner 'Fetch images from Instagram'
  rake 'social:fetch_instagram'
end

every 1.hour, at: 10 do
  runner 'Fetch videos from Youtube'
  rake 'social:fetch_youtube'
end

every 1.hour, at: 20 do
  runner 'Fetch posts from Twitter'
  rake 'social:fetch_twitter'
end

every 1.hour, at: 30 do
  runner 'Fetch upcoming events from Songkick'
  rake 'songkick:fetch_upcoming_events'
end
