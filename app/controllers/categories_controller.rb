class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    # Display the parameters that are send by new
    # render plain: params[:article].inspect

    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "Category was successfully created!"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category was successfully updated!"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:danger] = "Category was successfully deleted!"
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.required(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "Permittion denied."
      redirect_to root_path
    end
  end
end
