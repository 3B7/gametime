Gametime::Application.routes.draw do
  resources :relationships

  resources :roars

  get "sessions/new"
  post "sessions/create"
  get "sessions/destroy"

  resources :users

  root :to => 'users#new'
end
