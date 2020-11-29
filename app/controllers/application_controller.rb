class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :init_cart
  before_action :set_locale

  def after_sign_in_path_for(resource)
    if resource.admin?
      admins_root_path
    elsif resource.seller?
      sellers_root_path
    else
      session[:previous_url] || root_path
    end
  end

  protected

  def configure_permitted_parameters
    params["user"]["role"] = params["user"]["role"].to_i if params["user"].present?
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone, :address, :role) }
  end

  def init_cart
    if user_signed_in?
      current_user.carts.build(status: "active").save! unless current_user.cart_active.present?
    end
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
                      locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
