class Sellers::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @products = Product.where(user_id: current_user.id)
  end

  def new
    @product = current_user.products.build
    @options = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @product = current_user.products.build params_product
    @product.status = "in_stock" # defaut value
    if @product.save
      flash[:success] = "Thêm sách mới thành công"
    redirect_to sellers_products_path
    else
      render :new
    end
  end

  private

  def params_product
    params.require(:product).permit :name, :price, :image, :quantity, :status, :description, :category_id
  end

  def check_role
    unless current_user.seller?
      redirect_to root_path
    end
  end
end
