class UserSessionsController < ApplicationController

  skip_before_filter :require_login, except: [:destroy]

  
  def new
    @user = User.new
  end


  def create
    if @user = login(params[:user][:email],params[:user][:password],false)
      redirect_back_or_to(root_path, :notice => 'Login successful.')
    else
      @user = User.new
      flash.now[:error] = "There was a problem logging you in. Please check your email and password"; render :action => "new"
    end
  end



  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end