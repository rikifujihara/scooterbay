Rails.application.routes.draw do
  resources :addresses, only: [:edit, :update, :destroy]
  get 'offers/offers_out'
  get 'offers/offers_in'
  resources :offers, only: [:show, :edit, :update, :destroy]
  devise_for :users
  resources :users, only: [:destroy]
  resources :watched_items, only: [:destroy]
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
  post 'listings/:id/offer', to: 'listings#place_offer', as: "place_offer"
  post 'listings/:id/address', to: 'listings#specify_address', as: "specify_address"
  post 'listings/:id/watched_item', to: 'listings#watch_item', as: "watch_item"
  resources :listings
  
end
