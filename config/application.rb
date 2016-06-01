require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# TODO: remove this after it's released in prod. This is here so that db can be dropped in production env
ActiveRecord::Base.protected_environments = %w()

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

    # TODO: config.autoload_paths += %W(#{config.root}/lib) # add this line
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
