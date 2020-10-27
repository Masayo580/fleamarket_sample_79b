Rails.application.routes.draw do
  root 'home#index'
  resources :home, only: :index
  resources :items, only: [:new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
