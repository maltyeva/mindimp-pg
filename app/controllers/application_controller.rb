class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_profile
  helper_method :current_user

  def current_user
 	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  # def enrolled? 
  #   @course_session = CourseSession.find(params[:id])
  #   current_user.in?(@course_session.users)
  # end 


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

  def require_profile
    if current_user
    @user = current_user
    unless @user.profile_completed?
      redirect_to edit_user_path(@user)
      flash[:error] = "Please complete your profile first!"
    end
    end
  end

  def require_login
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
  end


# Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end


    # Confirms the correct user.
  def correct_user
    @user = User.find(session[:user_id])
    redirect_to(root_url) unless current_user == @user || current_user.is_admin?
  end

  def set_books
    @user = User.find(session[:user_id])
    redirect_to(root_url) unless current_user.books_permissions == true || current_user.is_admin?
  end

  def set_articles
    @user = User.find(session[:user_id])
    redirect_to(root_url) unless current_user.articles_permissions == true || current_user.is_admin?
  end

   def set_courses
    @user = User.find(session[:user_id])
    redirect_to(root_url) unless current_user.courses_permissions == true || current_user.is_admin?
  end





end
