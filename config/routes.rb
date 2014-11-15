Rails.application.routes.draw do
  get 'welcome/index'

  resources :companies

  resources :email_addresses, except: [:index, :show]

  resources :phone_numbers, except: [:index, :show]

  resources :people

  root 'welcome#index'
end
