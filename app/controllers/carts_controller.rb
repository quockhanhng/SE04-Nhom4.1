class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @cart = current_user.cart_active
    @cart_items = @cart.cart_items
  end

  private

  def check_role
    unless current_user.buyer?
      redirect_to root_path
    end
  end
end
