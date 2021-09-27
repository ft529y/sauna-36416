Rails.application.routes.draw do
  root to: "stores#index"
  devise_for :users, controllers:{  registrations:'users/registrations'  }
  resources :stores, only: [:index, :new, :create, :show] do
    collection do
      get 'list', 'check', 'search_store', 'search_prefecture'
    end
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:index, :show] do
    collection do
      get 'check', 'check_edit'
    end
    member do
      get 'unsubscribe', 'list'
    end
    member do
      patch 'withdrawal'
    end
  end
end