Rails.application.routes.draw do
  root 'items#index'
  
  devise_for :users do
    resources :carts
  end

  resources :items do
    resources :join_table_cart_items
  end

  resources :good_orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
