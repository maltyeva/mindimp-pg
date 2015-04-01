class BookListsController < ApplicationController

before_filter :require_login

  def create
    @book = Book.find(params[:book_id])
    current_user.add_book(@book)
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    @book = BookList.find(params[:id]).book
    current_user.remove_book(@book)
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end
end