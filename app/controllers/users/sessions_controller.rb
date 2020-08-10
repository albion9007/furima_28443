# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, if: :devise_controller?
  # only: [:create]

  # def new
  # end

  # def create
  #   User.create(user_params)
  #   redirect_to user_path(current_user.id)
  # end
  # def destroy
  #   user = User.find(current_user.id)
  #   user.destroy
    
  # end

  # protected

  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
  # end
end
