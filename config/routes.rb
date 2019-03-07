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
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
