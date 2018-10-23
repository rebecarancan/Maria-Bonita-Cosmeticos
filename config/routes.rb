Rails.application.routes.draw do
  resources :finances
  resources :banks
  resources :sales
  resources :income_types
  resources :record_types
  resources :expense_types
  resources :payments
  resources :income_kinds
  resources :notes
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
