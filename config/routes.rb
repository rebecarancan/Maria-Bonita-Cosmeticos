Rails.application.routes.draw do

  namespace :accounting do
    resources :orders
  end
  get 'home/index'
  get 'accounting', to: 'accounting/dashboard#index'
  get 'home', to: 'home#index'
  # get "products/new_product" => 'products#new_product', :as => :new_product

  namespace :accounting do
    get 'dashboard/index'
    resources :finances
    resources :banks
    resources :sales
    resources :income_types
    resources :record_types
    resources :expense_types
    resources :payments
    resources :notes
  end

  resources :products

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
