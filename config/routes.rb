Rails.application.routes.draw do


  resources :users
  resources :inventories
  resources :products
  resources :carts
  resources :cart_products

  post 'checkout', to: 'carts#checkout'
  get 'checkout', to: 'carts#show_checkout'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

end
