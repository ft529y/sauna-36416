Rails.application.routes.draw do
  root to: "stores#index"
  devise_for :users
  resources :stores, only: [:index, :new, :create, :show] do
    collection do
      get 'list'
    end
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:index, :show]
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
end
