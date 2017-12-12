require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  mount Sidekiq::Web, at: '/sidekiq'

  root 'static_pages#home'

  resources :events, only: [:index, :show]
  resources :organizers, only: [:index, :show]
  resource  :regions, only: :update
  resource  :subscribers, only: :create

  namespace :admin do
    resources :events
    resources :application_settings
  end
end
