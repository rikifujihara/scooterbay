Rails.application.routes.draw do
  resources :listings
  devise_for :users
  root 'pages#home'

  post 'listings/:id/order', to: 'listings#place_order', as: "place_order"
  
end
