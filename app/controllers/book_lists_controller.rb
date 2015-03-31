class BookListsController < ApplicationController

before_filter :require_login

  def create
    @book = Book.find(params[:id])
    current_user.add_book(@book)
    respond_to do |format|
      format.html { redirect_to @book }
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
