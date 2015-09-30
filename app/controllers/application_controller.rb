class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :random_program

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def random_program
    Program.get_random_program(current_user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :profile_photo
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
