class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  before_action :find_cart_item, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token


  def create
    @product = Product.find_by_id(params[:product_id])
    @cart_item = current_user.cart_active.cart_items.where(product_id: @product.id)
    if @cart_item.present?
      @cart_item = @cart_item.first
      @cart_item.quantity += 1
    else
      @cart_item = current_user.cart_active.cart_items.build
      @cart_item.quantity = 1 # default value
      @cart_item.product_id = @product.id
    end
    @cart_item.amount = @product.price * @cart_item.quantity
    @cart_item.price = @product.price
    @cart_item.delivery_fee = 30000 # default value
    if @cart_item.save!
      flash[:success] = "Thêm vào giỏ hàng thành công"
      redirect_to product_path(@product)
    end
  end

  def update
    @quantity_update = params[:quantity]
    @cart_item.quantity = @quantity_update
    @cart_item.amount = @cart_item.amount_calc
    @cart_item.save!
  end

  def destroy
    redirect_to root_path unless @cart_item.destroy
  end

  private

  def check_role
    unless current_user.buyer?
      redirect_to root_path
    end
  end

  def find_cart_item
    @cart_item = CartItem.find_by_id(params[:id])
    redirect_to root_path unless @cart_item
  end
end
