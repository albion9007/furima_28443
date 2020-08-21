Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
   }
  root 'items#index'
  resources :users, only: [:update]
  resources :items do
      resources :buys, only: [:new, :create]
  end
end