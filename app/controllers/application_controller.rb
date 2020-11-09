class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.admin?
      admins_root_path
    else
      session[:previous_url] || root_path
    end
  end
end
