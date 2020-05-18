Rails.application.routes.draw do
  get '/login', to: "users#login_form", as: "login"
  post '/login', to: "users#login"
  post '/logout', to: "users#logout", as: "logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'home/index', to: 'home#index', as: 'home'
  root to: 'home#index'
  resources :works 
end
