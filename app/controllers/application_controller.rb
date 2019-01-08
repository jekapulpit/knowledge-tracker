class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_resource)
    root_url
  end

  def after_sign_out_path_for(_resource_or_scope)
    root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username email password password_confirmation current_password])
  end

  private

  def layout_by_resource
    if devise_controller?
      'auth'
    else
      'application'
    end
  end
end
