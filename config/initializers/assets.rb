# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# bower - /vendor/assets/components
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
# jsbm - /assets
Rails.application.config.assets.paths << 'assets'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(jspm.js)

Rails.application.config.assets.initialize_on_precompile = false
