Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root 'items#index'
  resources :users, only: [:index, :new, :create, :destroy, :update]
end