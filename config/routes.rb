Rails.application.routes.draw do
  get 'pages/about_us'
  get 'pages/survey'
  resources :classifications
  resources :favorites
  resources :reviews
  resources :surveys, only: [:create]
  resources :dependents
  resources :categories
  resources :questions
  resources :users, param: :username, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :organizations
  resources :events
  resources :admins, param: :username

  root "pages#home"
  get 'pages/home'

  get 'food', to: 'pages#food', as: 'food'
  get 'housing', to: 'pages#housing', as: 'housing'
  get 'healthcare', to: 'pages#healthcare', as: 'healthcare'
  get 'education', to: 'pages#education', as: 'education'
  get 'childcare', to: 'pages#childcare', as: 'childcare'
  get 'legal_resources', to: 'pages#legal_resources', as: 'legal_resources'

  get 'pages/explore'

  get 'login', to: 'users#index'
  get 'users/new'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  #get /admins
  get "admin", to: "admins#index"
  get "admindashboard", to: "admins#dashboard"

  get "adminaccess", to: "asession#new"
  post "adminaccess", to: "asession#create"
  delete "adminlogout", to: "asession#destroy"

  # User session management
  get "login", to: "users#index"       # Use the index action for displaying login form
  post "userlogin", to: "users#login"  # Use the new login action for logging in
  delete "userlogout", to: "users#destroy" # Use the destroy action for user logout
end
