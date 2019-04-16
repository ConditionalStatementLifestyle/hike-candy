Rails.application.routes.draw do
  resources :users
  resources :posts
  get 'home', to: 'static#home'
end
