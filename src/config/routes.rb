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
end


