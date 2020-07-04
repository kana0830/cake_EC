Rails.application.routes.draw do
  get 'cart_items/index'
  devise_for :customers
  devise_for :admins
  namespace :admins do
  	root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :item_genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  resources :customers, only: [:show, :edit, :update, :exit, :destroy] 
  resources :shipping_addresses, only:[:index, :edit, :update, :destroy]

end
