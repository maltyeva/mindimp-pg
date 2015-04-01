class ReadBooksController < ApplicationController

before_filter :require_login

  def create
    @book = Book.find(params[:read_book_id])
    current_user.add_read_book(@book)
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    @book = ReadBook.find(params[:id]).book
    current_user.remove_read_book(@book)
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end





end
