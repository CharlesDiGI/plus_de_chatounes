Rails.application.routes.draw do

	root 'items#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users

  resources :items do
    resources :join_table_cart_items
  end

  resources :carts, param: :permalink
  # match 'my_cart', to: 'carts#show', via: [:get]
  resources :orders
  resources :charges, only: [:new, :create]

  namespace :admin do
    resources :items
    resources :admins, only: [:index]
    root 'admins#index'
  end

  # get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
