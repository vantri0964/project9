  Rails.application.routes.draw do
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
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
