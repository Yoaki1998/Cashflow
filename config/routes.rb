Rails.application.routes.draw do
  get 'projets/index'
  get 'projets/new'
  get 'projets/create'
  get 'projets/update'
  get 'projets/destroy'
  get 'projets/edit'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :moves
  resources :projets
  root to: "application#home"
  # Defines the root path route ("/")
end
