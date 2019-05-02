Rails.application.routes.draw do
  devise_for :users, path: "/", 
    path_names: {sign_in: "login", 
    sign_up: "users/signup"}, 
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  get "/", to: "pages#index", as: "root"
  
  resources :listings
  resources :users
  resources :pages

  get "/contact", to: "pages#contact", as: "contact"
  get "/about", to: "pages#about", as: "about"
  get "/dashboard", to: "pages#dash", as: "dash"

  post "/favourite", to: "listings#set_favourite", as: "set_favourite"
end


