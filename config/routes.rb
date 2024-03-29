Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipment_listings, only: [ :index, :show, :new, :create, :update, :edit ] do
    resources :reviews, only: :create
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, only: [ :index, :update ] do
    collection do
      get '/requests', to: 'bookings#index_in', as: 'requests'
      patch '/bookings/:id', to: 'bookings#request_accept'
      patch '/bookings/:id', to: 'bookings#request_deny'
    end
  end
end
