Rails.application.routes.draw do
  root 'static_pages#home'

  resources :events, only: [:index, :show]
  resources :organizers, only: [:index, :show]
  resource  :regions, only: :update
end
