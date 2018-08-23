Rails.application.routes.draw do
  # root to: 'inventories#index'
  # devise_for :users
  resources :users
  resources :inventories
  resources :products
  resources :carts
  resources :cart_products

  post 'checkout', to: 'carts#_checkout'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
end
