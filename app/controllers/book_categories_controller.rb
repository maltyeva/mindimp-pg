class BookCategoriesController < ApplicationController
  before_action :set_book_category, only: [:show, :edit, :update, :destroy]

  before_filter :require_login
  before_filter :require_admin, only: [:edit, :new]


  respond_to :html

  def index
    @book_categories = BookCategory.all
    respond_with(@book_categories)
  end

  def table_index
    @book_categories = BookCategory.all
    respond_with(@book_categories)
  end

  def show
    respond_with(@book_category)
  end

  def new
    @book_category = BookCategory.new
    respond_with(@book_category)
  end

  def edit
  end

  def create
    @book_category = BookCategory.new(book_category_params)
    @book_category.save
    respond_with(@book_category)
  end

  def update
    @book_category.update(book_category_params)
    respond_with(@book_category)
  end

  def destroy
    @book_category.destroy
    respond_with(@book_category)
  end

  private
    def set_book_category
      @book_category = BookCategory.find(params[:id])
    end

    def book_category_params
      params.require(:book_category).permit(:title, :description)
    end
end
