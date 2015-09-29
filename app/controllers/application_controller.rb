class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :random_program
  
  protected

  def random_program
    Program.get_random_program(current_user)
  end
end
