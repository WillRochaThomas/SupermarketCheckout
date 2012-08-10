SupermarketCheckout::Application.routes.draw do

  root :to => 'products#index'

  get "store/checkout"

  resources :basket_items

  resources :checkouts

  resources :products

  # The priority is based upon order of creation:
  # first created -> highest priority.

end
