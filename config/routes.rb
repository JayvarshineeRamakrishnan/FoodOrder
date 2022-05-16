Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "sessions#new"
  get "sign_up" , to: "registrations#new"
  post "sign_up" , to: "registrations#create"

  get "sign_in" , to: "sessions#new"
  post "sign_in" , to: "sessions#create"
  delete "sign_out", to: "sessions#destroy"

  get "owner_sign_in" , to: "owner/sessions#new"
  post "owner_sign_in" , to: "owner/sessions#create"
  delete "owner_sign_out", to: "owner/sessions#destroy"

  namespace :owner do
    root to: 'owners#index'
    resources :menus, only: [:index,:new,:create,:edit,:update,:destroy]
    resources :orders, only: [:index]
  end 

  get "/orders/cart", to: "orders#cart", as: :carts
  get "orders/index", to: "orders#index"
  put"/order_items/:id/decrement", to:"order_items#decrement"
  put"/order_items/:id/decrementInCart", to:"order_items#decrementInCart"

  post "/order_items/:id/addToCart", to:"order_items#addToCart"

  put"/order_items/:id/increment", to:"order_items#increment"
  put"/order_items/:id/incrementInCart", to:"order_items#incrementInCart"

  delete "/order_items/:id", to: "order_items#destroy"
  post "/orders/confirm", to: "orders#confirm"
  
  get "/orders", to: "owner/orders#index"

  get "/order_items/:id/viewOrderItems", to: "order_items#viewOrderItems"
  resources :menus
  resources :owners
  resources :orders
end
