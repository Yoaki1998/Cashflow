Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :moves
  root to: "devise/sessions#new"
  # Defines the root path route ("/")
  # root "articles#index"
end
