Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources 'users', only: :show
  resources :home, only: :index
  resources :items, only: :new
  resources :purchases, only: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
