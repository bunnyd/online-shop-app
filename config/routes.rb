Rails.application.routes.draw do

  resources :users
  resources :inventories
  resources :products
  resources :carts

  post 'checkout', to: 'carts#_checkout'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

end
