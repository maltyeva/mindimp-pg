class AdvisorRelationshipsController < ApplicationController

  before_filter :require_login

  def create
    @user = User.find(params[:advisee])
    @advisors = User.all.where(:is_admin => true)
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
