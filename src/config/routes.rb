Rails.application.routes.draw do
  devise_for :users, path: "/", 
    path_names: { 
      sign_in: "login", 
      sign_up: "users/signup"}, 
      controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  resources :listings
  resources :users
  resources :pages
  resources :addresses
  
  get "/", to: "pages#index", as: "root"
  get "/contact", to: "pages#contact", as: "contact"
  get "/about", to: "pages#about", as: "about"
  get "/dashboard", to: "pages#dash", as: "dash"

  post "/favourite", to: "listings#set_favourite", as: "set_favourite"
  delete "/favourite", to: "listings#unset_favourite", as: "unset_favourite"

  get "/map", to: "addresses#index", as: "map"

  post "/purchases/stripe", to: "purchases#stripe"
  get "/purchases/success", to: "purchases#success"

  get "/purchases/:id", to: "purchases#index", as: "purchase_history"

  get "/listing/:id/confirmation", to: "listings#confirmation", as: "confirmation"

  get "/dashboard/favourites", to: "pages#favourites", as: "favourites"
end


