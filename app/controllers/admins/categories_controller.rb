class Admins::CategoriesController < ApplicationController
  before_action :load_category, except: %i(index new create)
  before_action :authenticate_user!
  before_action :check_role

  def index
    @categories = Category.all
    @id_name = {}
    @categories.map { |c| @id_name[c.id] = c.name }
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params_category

    if @category.save
      flash[:success] = "Tạo danh mục thành công"
      redirect_to admins_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update params_category
      flash[:success] = "Cập nhật danh mục thành công"
      redirect_to admins_categories_path
    else
      flash.now[:danger] = "Cập nhật danh mục thất bại"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Xóa danh mục thành công"
      redirect_to admins_categories_path
    else
      flash[:danger] = "Xóa danh mục không thành công"
    end
  end

  private

  def params_category
    params.require(:category).permit :name, :parent_id, :slug
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category

    flash[:danger] = "Không tìm thấy danh mục phù hợp"
    redirect_to admins_root_path
  end

  def check_role
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
