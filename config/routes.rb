Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :usuarios
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :productos
  get "productos/index"
  get "users/new", to: "users#new"
  resources :usuarios
  post "users", to: "users#create"
  namespace :api, defaults: { format: 'json' }  do
  	namespace :v1 do
  		resources :usuarios
  	end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
