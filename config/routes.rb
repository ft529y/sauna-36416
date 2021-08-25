Rails.application.routes.draw do
  root to: "stores#index"
  devise_for :users
  resources :stores, only: [:index]
end
