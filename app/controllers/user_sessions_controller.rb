class UserSessionsController < ApplicationController

  skip_before_filter :require_login, except: [:destroy]

  
  def new
    @user = User.new
  end


  def create
    if @user = login(params[:user][:email],params[:user][:password],params[:remember],false)
      @user.update_attribute(:last_login, Time.now)
      session[:user_id] = @current_user.id
      redirect_back_or_to(:root, :notice => 'Welcome to MindImp!')
    else
      @user = User.new
      flash.now[:error] = "There was a problem logging you in. Please check your email and password"; render :action => "new"
    end
  end



  def destroy
    logout if logged_in?
    redirect_to(:root, notice: 'Logged out!')
  end
end