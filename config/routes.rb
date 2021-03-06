Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'pages#home'
  get 'plants/index'
  get 'plants/show'
  get 'plants/new'
  get 'plants/create'
  get 'users/show'
  namespace :owner do
    resources :bookings, only: [:index]
  end
  resources :plants, only: [:index, :new, :create, :show] do
    resources :bookings, only: [:new, :create, :index]
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch 'owner/bookings/:id', to: 'owner/bookings#accept_booking', as: 'owner_accept_booking'
  patch 'owner/bookings/:id', to: 'owner/bookings#refuse_booking', as: 'owner_refuse_booking'
end
