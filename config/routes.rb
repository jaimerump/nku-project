NkuProject::Application.routes.draw do

  # Login/logout routes
  get 'login', to: "login#index", as: :login_page
  post 'login', to: "login#login", as: :login_process
  
  resources :users
  
end
