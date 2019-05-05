  Rails.application.routes.draw do
  namespace :admin do
    get 'shares/_menu'
  end
  namespace :admin do
    get 'users/index'
    get 'users/create'
    get 'users/update'
    get 'users/edit'
  end
  get 'document/index'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'member/index'
  get 'sessions/new'

  root 'product#index'
  get '/product', to: 'product#index'
  get '/member',to: 'member#index'
  get '/home', to: 'users#index'
  get '/signup', to:'users#new'
  post '/signup',  to: 'users#create'
  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  get '/document', to:"post_documents#index"
  get '/microposts', to:"post_documents#index"
  delete '/logout', to: 'sessions#destroy'
  get "/alldocument", to: "document#index"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy, :show]
  resources :relationships,       only: [:create, :destroy]
  resources :document,            only: [:index, :show]

  namespace :admin do
    resources :users
  end
end
