Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :moves
  resources :projets do 
    get :completion
  end
  root to: "application#home"
  # Defines the root path route ("/")
end
