Rails.application.routes.draw do
  devise_for :users, path: "/", 
    path_names: {sign_in: "login", 
    sign_up: "users/signup"}, 
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  get "/", to: "pages#index", as: "root"
  get "/contact", to: "pages#contact", as: "contact"
  post "/contact", to: "pages#contact"
  get "/about", to: "pages#about", as: "about"
  
  resources :listings
  resources :users
  resources :pages
  
  
end


