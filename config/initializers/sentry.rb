Raven.configure do |config|
  config.dsn = "https://#{ENV['SENTRY_KEY']}:#{ENV['SENTRY_SECRET']}@sentry.io/110438"
  config.environments = ['production']
end
