source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta4', '< 5.1'
# Postgres as the database for active record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Slim templating
gem 'slim'
# activeadmin for administration and its dependencies
# TODO: change this to 1.0.0 when it's released. also adapt other dependencies
# TODO: dependencies: all of these + rspec-rails,
gem 'activeadmin', github: 'activeadmin/activeadmin'
gem 'active_skin'
gem 'devise', '> 4.x'
gem 'ransack',    github: 'activerecord-hackery/ransack'
gem 'kaminari',   github: 'amatsuda/kaminari', branch: '0-17-stable'
gem 'formtastic', github: 'justinfrench/formtastic'
gem 'cancancan'
# TODO: change to official draper, when it's released
gem 'draper', github: 'audionerd/draper', branch: 'rails5'
# To fix a Draper deprecation error
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
gem 'ckeditor'
gem 'pundit'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# file attachment management
gem 'paperclip'
# font awesome
gem 'font-awesome-rails'
# whenever for cron jobs
gem 'whenever', require: false
# songkick API wrapper
gem 'songkickr'
# countries
gem 'countries', require: 'countries/global'
# for cleaner urls
gem 'friendly_id', '~> 5.1.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # testing framework
  gem 'rspec-rails', '>= 3.5.0.beta1'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
  gem 'better_errors'
  gem 'teaspoon-jasmine'
  gem 'phantomjs', '~> 2.1', '>= 2.1.1.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'letter_opener'
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-db', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-bower', require: false
  gem 'capistrano-jspm', require: false
  gem 'capistrano-rails-console', require: false
  gem 'scss_lint', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
