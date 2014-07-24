Gametime::Application.routes.draw do
  resources :relationships

  resources :roars

  get "sessions/new"
  post "sessions/create"
  get "sessions/destroy"

  get 'buddies', to: 'users#buddies', as: 'buddies'
  
  resources :users

  root :to => 'users#new'
end
