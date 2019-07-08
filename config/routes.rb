Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#login'
  get 'pages/home', to:'pages#home'
  resources :atbs
  resources :associates
  resources :workstations

  get 'login', to: 'pages#new'
  post 'login', to: 'pages#create'
  delete 'logout', to: 'pages#destroy'
end
