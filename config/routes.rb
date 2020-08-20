Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root 'items#index'
  # users 'users#index'
  resources :users, only: [:update]
  resources :items, only: [:new, :create, :index, :destroy, :show, :edit, :update]
  resources :buys, only: [:new, :create, :index, :destroy]
  # :index, :new, :create, :destroy, 
end