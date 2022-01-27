class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(*)
    dashboard_path
  end

  def after_sign_out_path_for(*)
    flash[:notice] = 'Logged out successfully.'
    root_path
  end

  def configure_permitted_parameters
    attributes = %i[first_name last_name role_id profile_photo]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
