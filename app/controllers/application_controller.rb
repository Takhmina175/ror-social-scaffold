class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :gravatar_url) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :gravatar_url) }
  end
end
