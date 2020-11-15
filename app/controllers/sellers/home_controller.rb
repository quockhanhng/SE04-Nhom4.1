class Sellers::HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index; end

  private

  def check_role
    unless current_user.seller?
      redirect_to root_path
    end
  end
end
