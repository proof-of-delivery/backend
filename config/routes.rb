Rails.application.routes.draw do
  
  post '/pickup_items/filter', controller: :pickup_items, action: :filter
  post '/warehouse_orders/filter', controller: :warehouse_orders, action: :filter
  post '/warehouse_items/filter', controller: :warehouse_items, action: :filter
  post '/pod_headers/generate', controller: :pod_headers, action: :generate
  post '/pod_headers/filter', controller: :pod_headers, action: :filter
  
  resources :packaging_items
  resources :packaging_details
  resources :pickup_items
  resources :pickup_orders
  resources :customers
  resources :items
  resources :pod_headers
  resources :pod_items
  get '/warehouse_orders/confirmed', controller: :warehouse_orders, action: :confirmed_warehouseorders
  get '/warehouse_items/confirmed', controller: :warehouse_items, action: :confirmed_warehouse_items
  resources :warehouse_orders
  resources :warehouse_items do 
    member do
      post :request_quantity
      post :confirm_quantity
      post :approve
    end
  end

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
