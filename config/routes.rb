Rails.application.routes.draw do
  resources :inicio_sesions
  resources :usuarios
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/", to: "home#index"
  resources :productos
  get "productos/index"
  get "users/new", to: "users#new"
  get "users/inicioSesion", to: "users#inicioSesion"
  resources :usuarios
  post "users", to: "users#create"
  # Defines the root path route ("/")
  # root "articles#index"
end
