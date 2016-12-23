# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# jspm - /assets
Rails.application.config.assets.paths << Rails.root.join('assets')

# node_modules
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(jspm.js)

# records and booking scss
Rails.application.config.assets.precompile += %w(records.scss booking.scss)

Rails.application.config.assets.initialize_on_precompile = false
