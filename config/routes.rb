Rails.application.routes.draw do

  get 'accounting', to: 'accounting/dashboard#index'

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
  resources :home

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
