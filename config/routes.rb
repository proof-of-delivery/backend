Rails.application.routes.draw do
  resources :warehouse_items
  resources :customers
  resources :items
  resources :warehouse_orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
