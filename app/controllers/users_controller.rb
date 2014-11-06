class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, you are now registered."
      redirect_to root_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile has been updated."
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You are not allowed!"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end