Rails.application.routes.draw do
  get 'users/show'
  get 'orders/new'
  get 'orders/create'
  devise_for :users
  root to: 'laundromats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :laundromats, only: [:show, :destroy] do
    resources :orders, only: [:new, :create]  # Never need a double nesting
  end

  resources :orders, only: [:destroy, :show] do
    resources :reviews, only: [:new, :create]
  end
end
