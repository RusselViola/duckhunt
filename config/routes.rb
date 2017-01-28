Rails.application.routes.draw do

  get 'pages/about'
  get 'pages/contact'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin', to: 'sessions#new', as: 'signin'

  root 'sessions#new'

  resources :auth, only: :show
  resources :sessions, only: [:destroy, :new]
  resources :listings
  resources :users

end
