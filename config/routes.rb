Rails.application.routes.draw do

  get 'reviews/stars:integer'
  get 'reviews/description'
  get 'reviews/order_id:references'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :laundromats, only: [:index, :show] do
    resources :orders, only: [:new, :create]  # Never need a double nesting
  end

  resources :orders, only: [:destroy, :show, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end
end
