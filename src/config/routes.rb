Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: "/", path_names: {sign_in: "login"}
  get "/", to: "pages#index", as: "root"
  

end
