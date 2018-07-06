class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User was successfully registered!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User Profile was successfully updated!"
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = "User was successfully deleted!"
    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "Permittion denied."
      redirect_to root_path
    end
  end
end
