Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :carts, only: [:show]
  resources :cart_products, only: [:create, :destroy]

  resources :orders, only: [:create, :show, :index]
  resources :order_products, only: [:create, :destroy]
end
