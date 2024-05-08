Rails.application.routes.draw do
  namespace :admin do
      resources :categories
      resources :products
      resources :users

      root to: "categories#index"
    end
  resources :categories, only: %i(index show)
  devise_for :users
  patch "/cart", to: "carts#update", as: :add_to_cart
  get "/checkout", to: "checkouts#show", as: :checkout
  get "up" => "rails/health#show", as: :rails_health_check

  root "site#index"
end
