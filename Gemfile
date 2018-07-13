source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'
# Postgres as the database for active record
gem 'pg', '~> 0.20'
# Slim templating
gem 'slim'
# activeadmin for administration and its dependencies
gem 'activeadmin', github: 'activeadmin'
gem 'active_skin'
gem 'cancancan'
gem 'devise', '> 4.x'
gem 'draper', '> 3.x'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'kaminari', '>= 1.x'
gem 'ransack',    github: 'activerecord-hackery/ransack'
# To fix a Draper deprecation error
gem 'activeadmin_addons'
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
gem 'ckeditor'
gem 'pundit'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Sentry
gem 'sentry-raven'
# file attachment management
gem 'paperclip'
# font awesome
gem 'font-awesome-rails'
# whenever for cron jobs
gem 'whenever', require: false
# countries
gem 'countries', require: 'countries/global'
# for cleaner urls
gem 'friendly_id', '~> 5.1.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Geo
gem 'geocoder'
# songkick API wrapper
gem 'songkickr', git: 'https://github.com/moonleerecords/songkickr.git'
# Youtube
gem 'yt', '~> 0.26.3'
# Twitter
gem 'twitter'
# Gibbon for Mailchimp
gem 'gibbon'
# log management
gem 'paper_trail'
# sprockets for es6
gem 'sprockets', '>= 3.0.0'
gem 'sprockets-es6'
# browserify
gem 'browserify-rails'
# cookies law
gem 'cookies_eu'
# nokogiri
gem 'nokogiri', '>= 1.8.1'
# coffee
gem 'coffee-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'better_errors'
  gem 'byebug'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
  gem 'phantomjs', '~> 2.1', '>= 2.1.1.0'
  gem 'rspec-rails', '>= 3.5.0.beta1'
  gem 'scss_lint', require: false
  gem 'teaspoon-jasmine'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '~> 3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'letter_opener'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # capistrano
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-npm', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rails-db', require: false
  gem 'capistrano-rvm', require: false
end
