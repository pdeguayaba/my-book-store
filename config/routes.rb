Rails.application.routes.draw do
  resources :books
  devise_for :users
  root 'pages#home'

  get 'dashboard' => 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Create action
  post '/buy/:slug', to: 'transactions#create', as: :buy

  # Pickup action
  get '/pickup/:uuid', to: 'transactions#pickup', as: :pickup
end
