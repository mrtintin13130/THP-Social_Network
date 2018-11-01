Rails.application.routes.draw do
  resources :registration, only: [:new, :create]
  resources :home, only: [:index]
  resources :gossip
  get '/login', to: 'home#login'
  post '/login', to: 'home#check'
  get '/logout', to: 'home#logout'
  root 'home#index'
end
