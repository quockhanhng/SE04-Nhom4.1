class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  before_action :find_cart

  def index; end

  def checkout
    redirect_to root_path unless @cart
  end

  private

  def find_cart
    @cart = current_user.cart_active
    @cart_items = @cart.cart_items
  end

  def check_role
    unless current_user.buyer?
      redirect_to root_path
    end
  end
end
