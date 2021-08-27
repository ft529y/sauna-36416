Rails.application.routes.draw do
  root to: "stores#index"
  devise_for :users
  resources :stores, only: [:index, :new, :create] do
    collection do
      get 'list'
    end
  end
end
