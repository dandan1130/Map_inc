Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'maps#home'
  get  '/search', to: 'parks#index'
  get  '/about', to: 'maps#about'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resource :sessions, only: [:new, :create, :destroy]  
    resources :users, shallow: true do 
      resource :bookmarks, only: [:create, :destroy]
        get :bookmarks, on: :collection
    end
  resources :parks 
  resources:shops
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
