class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.




  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,:lastname,:birthday,:address,:city,:email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name,:lastname,:birthday,:address,:city,:email,:password,:current_password) }
  end
 def logout
 
 end
  
end
