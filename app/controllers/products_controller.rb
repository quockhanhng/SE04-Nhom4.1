class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def show
    @product = Product.find_by_id(params[:id])
  end

  private

  def check_role
    if current_user.admin?
      redirect_to admins_root_path
    end
    if current_user.seller?
      redirect_to sellers_root_path
    end
  end
end
