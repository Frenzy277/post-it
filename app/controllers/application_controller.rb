class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def admin?
    logged_in? && current_user.admin
  end

  def require_user
    if !logged_in?
      flash[:error] = "You have to log in!"
      redirect_to login_url
    end
  end

  def require_creator
    if (current_user != @post.creator) && !admin?
      access_denied
    end
  end

  def require_admin
    access_denied if !admin?  
  end

  def access_denied
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

end
