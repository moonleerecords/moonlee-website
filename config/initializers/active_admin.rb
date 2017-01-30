# rubocop:disable Metrics/BlockLength
ActiveAdmin.setup do |config|
  config.site_title = 'Moonlee'

  config.site_title_link = '/admin'

  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user

  config.logout_link_path = :destroy_admin_user_session_path

  config.root_to = 'posts#index'

  config.comments = false

  config.batch_actions = true

  config.localize_format = :default

  config.favicon = 'favicon.ico'

  config.namespace :admin do |admin|
    admin.build_menu :utility_navigation do |menu|
      menu.add label: 'Visit website',
               url: '/',
               html_options: { target: :blank }
      admin.add_current_user_to_menu menu
      admin.add_logout_button_to_menu menu
    end
  end

  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      menu.add label: 'Shows',
               priority: 6 do |shows|

        shows.add label: 'Add shows', url: 'https://tourbox.songkick.com', html_options: { target: :blank, title: 'Links to Songkick' }
        shows.add label: 'Fetch new shows', url: '/admin/events/fetch_upcoming_shows'
      end
    end
  end
end

# This solves problem with FriendlyId
ActiveAdmin::ResourceController.class_eval do
  def find_resource
    id_field = 'id'
    begin
      received_id = Integer(params[:id])
    rescue ArgumentError
      received_id = nil
    end

    if scoped_collection.is_a?(FriendlyId) && received_id.nil?
      id_field = scoped_collection.friendly_id_config.query_field
    end

    scoped_collection.find_by! id_field => params[:id]
  end
end

module ActiveAdmin
  module ViewHelpers
    include ReleasesHelper
  end
end
