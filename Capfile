# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails/db'
require 'capistrano/rails/migrations'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'
require 'capistrano/npm'
require 'capistrano/jspm'
require 'whenever/capistrano'
require 'capistrano/rails/console'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
