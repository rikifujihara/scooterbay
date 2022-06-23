Rails.application.routes.draw do
  get 'orders/success'
  get 'orders/bought'
  get 'orders/sold'
  get 'offers/offers_out'
  get 'offers/offers_in'
  resources :offers, only: [:show, :edit, :update]
  devise_for :users
  resources :listings
  resources :users, only: [:destroy]
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
    end
  end
  root 'pages#home'

  post 'listings/:id/order', to: 'listings#place_order', as: "place_order"
  post 'listings/:id/offer', to: 'listings#place_offer', as: "place_offer"
  
end
