class Sellers::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role

  def index
    @categories = Category.all
    @id_name = {}
    @categories.map { |c| @id_name[c.id] = c.name }
  end

  def check_role
    unless current_user.seller?
      redirect_to root_path
    end
  end
end
