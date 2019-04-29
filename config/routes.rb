  Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'member/index'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'product#index'
  get '/product', to: 'product#index'
  get '/member',to: 'member#index'
  get '/home', to: 'users#index'
  get '/signup', to:'users#new'
  post '/signup',  to: 'users#create'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  get 'document', to:"post_documents#index"
  get '/microposts', to:"post_documents#index"
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
end
