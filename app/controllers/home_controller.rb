class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @product_group_four = []
    @product_group_four_sf = []
    Product.all.each_slice(4) {|a| @product_group_four.push(a)}
    Product.all.shuffle.each_slice(4) {|a| @product_group_four_sf.push(a)}
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
