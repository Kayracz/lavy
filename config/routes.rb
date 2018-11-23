Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :laundromats, only: [:new, :create, :index, :show] do
    resources :orders, only: [:new, :create]  # Never need a double nesting # Nick removed show from here
  end

  resources :orders, only: [:destroy, :show] do
    member do
      get 'map_pick_up', to: 'orders#map_pick_up'
      get 'map_delivery', to: 'orders#map_delivery'
    end
    resources :reviews, only: [:new, :create]
  end



  get 'dashboard', to: 'users#show', as: :dashboard   # there is no user show route generated by devise
  # get 'dashboard/map_pick_up/:id', to: 'orders#map_pick_up', as: :map_pick_up
  # get 'dashboard/map_delivery/:id', to: 'orders#map_delivery', as: :map_delivery
  # get 'dashboard/map_laundromat/:id', to: 'orders#map_laundromat', as: :map_laundromat
end
