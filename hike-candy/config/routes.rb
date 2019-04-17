Rails.application.routes.draw do

  root 'welcome#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'authentications#new'
  post '/login', to: 'authentications#create'
  delete '/logout', to: 'authentications#destroy'
  get '/feed', to: 'feed#feed'
  get 'users/:id/follow', to: 'relationships#index', as: "follow"

  resources :users, only: [:index, :show]
  resources :posts
  resources :trips
  resources :relationships, only: [:create, :destroy]
end
