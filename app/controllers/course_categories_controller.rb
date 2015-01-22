class CourseCategoriesController < ApplicationController
  before_action :set_course_category, only: [:show, :edit, :update, :destroy]

  before_filter :require_admin, :only => :edit
  respond_to :html

  def index
    @course_categories = CourseCategory.all
    respond_with(@course_categories)
  end

  def show
    respond_with(@course_category)
  end

  def new
    @course_category = CourseCategory.new
    respond_with(@course_category)
  end

  def edit
  end

  def create
    @course_category = CourseCategory.new(course_category_params)
    @course_category.save
    respond_with(@course_category)
  end

  def update
    @course_category.update(course_category_params)
    respond_with(@course_category)
  end

  def destroy
    @course_category.destroy
    respond_with(@course_category)
  end

  private
    def set_course_category
      @course_category = CourseCategory.find(params[:id])
    end

    def course_category_params
      params.require(:course_category).permit(:title, :description)
    end
end
