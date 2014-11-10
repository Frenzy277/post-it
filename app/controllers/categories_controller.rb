class CategoriesController < ApplicationController
  before_action :require_user, except: [:show]
  before_action :require_admin, except: [:show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      flash[:notice] = "New category has been added successfully!"
      redirect_to posts_url
    else
      render :new
    end
  end

  def show
    @category = Category.find_by(slug: params[:id])
  end
end