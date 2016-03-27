Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # www.moonleerecords.com
  root to: 'records/home#index'

  resources :artists, only: [:index, :show]

  # booking.moonleerecords.com
  constraints subdomain: 'booking' do
    scope module: 'booking' do
      # TODO: root booking.moonleerecords.com
      # resources :artists
    end
  end
end
