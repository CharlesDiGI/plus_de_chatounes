Rails.application.routes.draw do
	root 'items#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users

  resources :items do
    resources :join_table_cart_items
  end
  
  resources :carts
  resources :orders
  resources :charges

  namespace :admin do
    resources :items
    resources :admins, only: [:index]
    root 'admins#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
