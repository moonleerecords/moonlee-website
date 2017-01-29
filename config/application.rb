require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'action_view/railtie'
require 'sprockets/railtie'
# require 'rails/test_unit/railtie'
require 'sprockets/es6'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MoonleeWebsite
  class Application < Rails::Application
    # we set environmental variables here since they don't work in some cases when you set them in initializers
    Rails.application.config.before_configuration do
      env_file = Rails.root.join('config', 'application.yml')
      if ENV['CUSTOM_ENV_FILE']
        env_file = Rails.root.join('config', ENV['CUSTOM_ENV_FILE'])
      end
      if File.exist?(env_file)
        YAML.safe_load(File.open(env_file)).each do |key, value|
          ENV[key.to_s] = value.to_s
        end
      end
    end

    # additional autoload paths
    Rails.application.config.autoload_paths << Rails.root.join('lib')

    # default timezone
    Rails.application.config.time_zone = 'Europe/Ljubljana'
    Rails.application.config.active_record.default_timezone = :local
  end
end
