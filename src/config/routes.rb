Rails.application.routes.draw do
  devise_for :users, path: "/", path_names: {sign_in: "login"}
  get "/", to: "pages#index", as: "root"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # put "/users/:id/edit", to: "users#update", as: "edit_user"
  # get "/users/:id/show", to: "users#show", as: "user"
  # get "/users/create", to: "users#new", as: "new_user"
  # post "/users/create", to: "users#create", as: "new_user"
  resources :listings
  resources :users
end


