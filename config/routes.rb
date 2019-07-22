Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#login'
  get 'pages/home', to:'pages#home'
  get '/workstations/associate_allocation', to: 'workstations#associate_allocation'
  get '/workstations/associate_work_status', to: 'workstations#associate_work_status'
  get 'workstations/associate_report', to: 'workstations#associate_report'
  resources :atbs
  resources :associates
  resources :workstations

  get 'login', to: 'pages#new'
  post 'login', to: 'pages#create'
  delete 'logout', to: 'pages#destroy'
  get 'pages/workstation_home', to: "pages#workstation_home"

  post '/workstations/atb_filter', to: 'workstations#atb_filter'
  
end
