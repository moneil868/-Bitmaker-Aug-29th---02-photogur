Rails.application.routes.draw do

  root 'pictures#index'
  resource :users, only: %i(create new)
  resources :pictures
  resources :posts


end
