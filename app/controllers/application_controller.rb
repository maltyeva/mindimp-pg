class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_filter :require_login
  helper_method :current_user

  def current_user
 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end





  private

  def not_authenticated
  	redirect_to login_path, alert: "Please login first"
  end


  def restricted_redirect_to(new_path=root_path)
    flash[:error] = "Sorry, that action or page is restricted."
    redirect_to new_path
  end

  def require_admin(new_path=root_path)
    restricted_redirect_to(new_path) unless current_user.is_admin?
  end

  def require_login
    if current_user.nil?
      flash[:error] = "Sorry, that action requires you to log in."
      redirect_to root_path
    end
  end


end
