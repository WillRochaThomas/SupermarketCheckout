ReevooCheckout::Application.routes.draw do
  resources :basket_items

  resources :checkouts

  resources :products

  # The priority is based upon order of creation:
  # first created -> highest priority.


end
