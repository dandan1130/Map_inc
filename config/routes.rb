Rails.application.routes.draw do
  get 'users/new'

  root 'maps#home'

  get '/about', to: 'map#about'
  get '/signup', to: 'map#signup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
