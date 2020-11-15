class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.admin?
      admins_root_path
    else
      session[:previous_url] || root_path
    end
  end

  protected

  def configure_permitted_parameters
    params["user"]["role"] = params["user"]["role"].to_i if params["user"].present?
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone, :address, :role) }
  end
end
