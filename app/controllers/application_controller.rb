class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end

  # def after_sign_up_path_for(resource)
  #   user_path(current_user.id) 
  # end

  # def after_sign_in_path_for(resource)
  #   root_path
  # end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  

  def after_sign_out_path_for(resource)
    root_path
  end
end
