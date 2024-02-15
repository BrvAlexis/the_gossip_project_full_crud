Rails.application.routes.draw do
 
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root "home#show"
  get '/welcome', to: 'home#show'
  get '/welcome/:first_name', to: 'home#show'
  # get '/gossip', to: 'gossip#show'
  resources :profil
  
  get '/contact', to: "contact#show"
  get '/team', to: "team#show"
  resources :gossips
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end
