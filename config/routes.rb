NkuProject::Application.routes.draw do

  # Login/logout routes
  get 'login', to: "login#index", as: :login_page
  post 'login', to: "login#login", as: :login_process
  get 'logout', to: "login#logout", as: :logout
  
  resources :users
  
  root "login#index" 
  
end
