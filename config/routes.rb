Rails.application.routes.draw do
  namespace :admin do
      resources :categories
      resources :products
      resources :users

      root to: "categories#index"
    end
  resources :categories, only: %i(index show)
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root "site#index"
end
