Rails.application.routes.draw do

  root 'welcome#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'authentications#new'
  post '/login', to: 'authentications#create'
  post '/logout', to: 'authentications#destroy'
  get '/feed', to: 'feed#feed'

  resources :users, only: [:index, :show, :create]
  resources :posts, only: [:index, :show, :create]
end
