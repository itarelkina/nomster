Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  root 'places#index'
  get '/:page', to: 'places#index'
  resources :places do
  resources :comments, only: :create
  resources :photos, only: [:create, :destroy]
end
resources :users, only: :show
end