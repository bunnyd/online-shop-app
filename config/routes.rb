Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :carts, only: [:index, :edit, :update]
  end
  resources :users, :path => 'sellers', as: 'sellers' do
    resources :inventories, :path => 'store', only: [:show, :index]
  end
  resources :sellers do
    resources :inventories, only: [:index] do
      resources :products, only: [:index]
    end
  end

  # resources :products
end
