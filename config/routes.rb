Rails.application.routes.draw do
  root 'listings#index'
  get 'pages/about'
  get 'pages/contact'

  resources :listings
end
