class CoursePeriodsController < ApplicationController
  before_action :set_course_period, only: [:show, :edit, :update, :destroy]
  
  before_filter :require_login
  before_filter :require_admin, :only => :edit
  before_filter :set_courses


  respond_to :html

  def index
    @course_periods = CoursePeriod.all
    @active_course_periods = CoursePeriod.where("active = ?", true)
    respond_with(@course_periods)
  end

  def show
    respond_with(@course_period)
  end

  def new
    @course_period = CoursePeriod.new
    respond_with(@course_period)
  end

  def edit
  end

  def create
    @course_period = CoursePeriod.new(course_period_params)
    @course_period.save
    respond_with(@course_period)
  end

  def update
    @course_period.update(course_period_params)
    respond_with(@course_period)
  end

  def destroy
    @course_period.destroy
    respond_with(@course_period)
  end

  private
    def set_course_period
      @course_period = CoursePeriod.find(params[:id])
    end

    def course_period_params
      params.require(:course_period).permit(:title, :year, :period_no, :active, :past, :upcoming)

    end
end
