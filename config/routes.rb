Rails.application.routes.draw do
  resources :books
  devise_for :users
  devise_for :uders
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
