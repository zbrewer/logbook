class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  # If the controller is a devise controller (user path) then allow the parameters specified
  before_action :configure_permitted_parameters, if: :devise_controller?





  protected

  # Sets the parameters allowed for use wen signing up or updating a user account
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :birth_date,
                                                  :certificate_number, :certificate_type,
                                                  :certificate_issue_date)
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name, :birth_date,
                                                         :certificate_number, :certificate_type,
                                                         :certificate_issue_date)
  end

end
