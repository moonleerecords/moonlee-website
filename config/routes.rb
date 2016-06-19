Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'

  scope module: 'records', as: 'records' do
    resources :posts, only: [:index, :show]
    resources :artists, only: [:index, :show]
    resources :releases, only: [:index, :show]
    resources :events, only: [:index]
    get 'about', to: 'statics#about'
  end

  # booking.moonleerecords.com
  constraints subdomain: 'booking' do
    scope module: 'booking', as: 'booking' do
      root to: 'home#index', as: 'root'
      resources :artists, only: [:index, :show]
      resources :events, only: [:index]
    end
  end

  # www.moonleerecords.com
  root to: 'records/home#index'
end
