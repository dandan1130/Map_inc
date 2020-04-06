Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root 'maps#home'
 get  '/search', to: 'parks#index'
  get  '/about', to: 'maps#about'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  get '/park', to: 'parks#new'
  post '/park', to: 'parks#create'
  
  get '/shop', to: 'shops#new'
  post '/shop', to: 'shops#create'
  
resources :users
resources :parks
resources:shops

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
