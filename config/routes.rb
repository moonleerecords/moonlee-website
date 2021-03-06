Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'

  post 'newsletter/subscribe', to: 'newsletter#subscribe', defaults: { format: 'json' }

  # records
  scope module: 'records', as: 'records' do
    resources :posts, path: 'news', only: [:index, :show]
    resources :artists, only: [:index, :show]
    resources :releases, only: [:index, :show]
    resources :events, only: [:index]
    get 'about', to: 'statics#about'
    get 'press', to: 'statics#press'
  end

  # booking
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
