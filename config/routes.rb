Rails.application.routes.draw do
 
  get '/users', to: "users#index", as: "users"
  get '/users/:id', to: "users#show", as: "user"
  get '/login', to: "users#login_form", as: "login"
  post '/login', to: "users#login"
  post '/logout', to: "users#logout", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'home/index', to: 'home#index', as: 'home'
  root to: 'home#index'
  resources :works 

  resources :works do 
    post '/upvote', to: "votes#upvote", as: "upvote"
  end 
end
