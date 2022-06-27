Rails.application.routes.draw do
  resources :offers, only: [:show, :edit, :update, :destroy]
  get 'offers/offers_out'
  get 'offers/offers_in'
  devise_for :users
  resources :users, only: [:destroy]
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
    end
  end
  root 'pages#home'
  
  get 'listings/offroad'
  get 'listings/highspeed'
  get 'listings/fattyre'
  get 'listings/commuter'
  get 'listings/kids'
  get 'listings/foldable'
  post 'listings/:id/order', to: 'listings#place_order', as: "place_order"
  post 'listings/:id/offer', to: 'listings#place_offer', as: "place_offer"
  resources :listings
  
end
