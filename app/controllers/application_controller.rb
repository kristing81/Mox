class ApplicationController < ActionController::Base
  protect_from_forgery with: :reset_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
  end

end