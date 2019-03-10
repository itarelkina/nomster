Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  root 'places#index'
  resources :places
end