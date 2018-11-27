Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  get 'accounting', to: 'accounting/dashboard#index'
  get 'home', to: 'home#index'
  # get "products/new_product" => 'products#new_product', :as => :new_product

  get 'accounting', to: 'accounting/dashboard#index'

  namespace :accounting do
    get 'dashboard/index'
    resources :master_finances
    resources :master_sales
    resources :master_orders
    resources :master_notes
    resources :master_banks
    resources :banks
    resources :sales
    resources :payments
    resources :notes
    resources :orders
  end

  resources :products

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
