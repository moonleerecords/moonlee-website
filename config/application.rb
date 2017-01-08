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
      env_file = File.join(Rails.root, 'config', 'application.yml')
      if ENV['CUSTOM_ENV_FILE']
        env_file = File.join(Rails.root, 'config', ENV['CUSTOM_ENV_FILE'])
      end
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value.to_s
      end if File.exist?(env_file)
    end

    # additional autoload paths
    Rails.application.config.autoload_paths << "#{Rails.root}/lib"
  end
end
