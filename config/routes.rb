Rails.application.routes.draw do

  get 'pages/about'
  get 'pages/contact'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin', to: 'sessions#new', as: 'signin'

  get 'seller' => 'listings#seller'

  root 'listings#index'

  resources :auth, only: :show
  resources :sessions, only: [:destroy, :new]
  resources :listings
  resources :users

end
