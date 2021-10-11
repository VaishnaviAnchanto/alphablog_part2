Rails.application.routes.draw do
  devise_for :bloggers
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles  #only: [:show, :index, :new , :create ,:edit, :update]
  get'signup' ,to: 'users#new'
  
  resources :users, except: [:new]

  resources :bloggers , only: [:show ,:index]
  
end
