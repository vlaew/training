class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # devise_group :app_user, contains: [:user, :admin]
  before_action :authenticate_user!

  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def current_user
    super.roleable
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :name
  # end
end
