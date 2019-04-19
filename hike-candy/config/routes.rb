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
  resources :posts, only: [:index, :new, :create, :show, :edit, :update]
  resources :trips, only: [:index, :new, :create, :show, :edit, :update]
  resources :comments, only: [:create]
  resources :relationships, only: [:create, :destroy]

  delete 'trips/:id', to: 'trips#destroy'
  delete 'posts/:id', to: 'posts#destroy'

end
