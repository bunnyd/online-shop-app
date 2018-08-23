Rails.application.routes.draw do
<<<<<<< HEAD
  # root to: 'inventories#index'
  # devise_for :users
  resources :users do
    resources :carts, only: [:show, :edit, :update]
  end
=======

  resources :users
  resources :inventories
  resources :products
  resources :carts
>>>>>>> erika

  post 'checkout', to: 'carts#_checkout'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

<<<<<<< HEAD
  resources :sellers do
    resources :inventories, only: [:index, :edit, :destroy] do
      resources :products, only: [:new, :show, :edit, :destroy]
    end
  end

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

=======
>>>>>>> erika
end
