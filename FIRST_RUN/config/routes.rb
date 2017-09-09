Rails.application.routes.draw do

  root 'pictures#index'
  resource :users, only: %i(create new)
  resource :sessions, only: %i(create new destroy)
  resources :pictures
  resources :posts


end
