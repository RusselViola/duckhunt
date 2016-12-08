Rails.application.routes.draw do
  root 'listings#index'
  get 'pages/about'
  get 'pages/contact'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin', to: 'sessions#new', as: 'signin'

  resources :auth, only: :show
  resources :sessions, only: [:destroy, :new]
  resources :shirts
  resources :users

  resources :listings
end
