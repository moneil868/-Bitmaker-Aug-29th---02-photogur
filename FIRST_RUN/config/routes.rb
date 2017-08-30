Rails.application.routes.draw do
  root 'pictures#index'
   get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id' => 'pictures#show'

  get 'pictures/:id/edit' => "pictures#edit"
  patch 'pictures/:id' => "pictures#update"

  delete 'pictures/:id' => 'pictures#destroy'


  get 'posts'          => 'posts#index'
  post 'posts'         => 'posts#create'
  get 'posts/new'      => 'posts#new'
  get 'posts/:id'      => 'posts#show'
  get 'posts/:id/edit' => "posts#edit"
  patch 'posts/:id'    => "posts#update"
  delete 'posts/:id'   => 'posts#destroy'


end
