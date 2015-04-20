class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  before_filter :require_login
  before_filter :require_admin, only: [:edit, :new]
  before_filter :set_books


  respond_to :html

  def index
    @books = Book.all
    respond_with(@books)
  end

  def index_table
    @books = Book.all
  end

  def show
    #@category = Book.find
    @book = Book.find(params[:id])
    @discussion_questions = @book.discussion_questions.visible.all
    respond_with(@book)
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


  #pages related to discussion questions
  def questions
    @book = Book.find(params[:id])
    @discussion_questions = @book.discussion_questions.all
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
