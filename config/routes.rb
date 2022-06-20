Rails.application.routes.draw do
  get 'orders/success'
  get 'orders/bought'
  get 'orders/sold'
  resources :listings
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  root 'pages#home'

  post 'listings/:id/order', to: 'listings#place_order', as: "place_order"
  
end
