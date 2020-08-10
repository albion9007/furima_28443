class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end

  def after_sign_up_path_for(resource)
    user_path(current_user.id) 
  end

  def after_sign_out_path_for(resource)
    top_path
  end
end
