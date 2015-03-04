class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  before_filter :require_login
  before_filter :require_admin, only: [:edit, :new]


  respond_to :html

  def index
    @books = Book.all
    respond_with(@books)
  end

  def show
    respond_with(@book)
    #@category = Book.find
    @book.discussion_questions = DiscussionQuestion.where(book_id: @book.id)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @books_categories = BookCategory.where(:id => params[:book_category_id])
    @book.book_categories << @books_categories
    @book.save
    respond_with(@book)
  end

  def update
    @books_categories = BookCategory.where(:id => params[:book_category_id])
    @book.book_categories << @books_categories
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end


    def book_params
      params.require(:book).permit(:title, :author, :cover, :description, :genre, :lexile_measure, 
                                   :url, :page_count, :book_category_ids => [], :user_ids => [])
    end
end
