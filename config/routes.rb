Rails.application.routes.draw do
  root to: "stores#index"
  devise_for :users
  resources :stores, only: [:index, :new, :create, :show] do
    collection do
      get 'list'
    end
    resources :comments, only: :create
  end
end
