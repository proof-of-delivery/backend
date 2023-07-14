Rails.application.routes.draw do
  resources :users
  resources :items
  resources :warehouse_orders
  post '/auth/login', to: 'authentication#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
