class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    puts policy_name
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    redirect_to(request.referrer || root_path)
  end

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
