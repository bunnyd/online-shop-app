Rails.application.routes.draw do
  # root to: 'inventories#index'
  # devise_for :users
  resources :users do
    resources :carts, only: [:show, :edit, :update]
  end

  resources :inventories, :path => 'stores', only: [:show, :index] do
    resources :products, only: [:index, :show]
  end

  resources :sellers do
    resources :inventories, only: [:index, :edit, :destroy] do
      resources :products, only: [:new, :show, :edit, :destroy]
    end
  end

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

end
