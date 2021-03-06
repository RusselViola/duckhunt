Rails.application.routes.draw do

  get 'pages/about'
  get 'pages/contact'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'signin', to: 'sessions#new', as: 'signin'

  get 'seller', to: 'listings#seller'
  get 'sales', to: 'orders#sales'
  get 'purchases', to: 'orders#purchases'

  root 'listings#index'

  resources :auth, only: :show
  resources :sessions, only: [:destroy, :new]

  resources :listings do
    resources :orders, only: [:new, :create]
  end
  resources :users

end
