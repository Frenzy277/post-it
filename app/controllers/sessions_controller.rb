class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authentication(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have logged in."
      redirect_to :root
    else
      flash[:error] = "Incorrect username and/or password!"
      redirect_to :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to :root
  end
end