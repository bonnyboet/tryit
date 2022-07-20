Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :equipment_listings do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, except: [ :new, :create ] do
    collection do
      get '/requests', to: 'bookings#requests_index', as: 'requests'
      patch '/bookings/:id', to: 'bookings#request_accept'
      patch '/bookings/:id', to: 'bookings#request_deny'
    end
  end
end
