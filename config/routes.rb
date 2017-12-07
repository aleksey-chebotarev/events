Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  resources :events, only: [:index, :show]
  resources :organizers, only: [:index, :show]
  resource  :regions, only: :update
  resource  :subscribes, only: :create

  namespace :admin do
    resources :events
  end
end
