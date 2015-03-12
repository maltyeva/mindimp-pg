class CourseSessionsController < ApplicationController
  before_action :set_course_session, only: [:show, :edit, :update, :destroy]

  before_filter :require_login
  before_filter :require_admin, only: [:index, :edit, :update, :destroy, :new]
  before_filter :set_courses


  respond_to :html

  def index
    @course_sessions = CourseSession.all
    respond_with(@course_sessions)
  end

  def show
    respond_with(@course_session)
  end

  def new
    @course_session = CourseSession.new
    respond_with(@course_session)
  end

  def edit
  end

  def create
    @course_session = CourseSession.new(course_session_params)
    @students_sessions = User.where(:id => params[:user_id])
    @course_session.users << @students_sessions
    @course_session.save
    respond_with(@course_session)
  end

  def update
    @students_sessions = User.where(:id => params[:user_id])
    @course_session.users << @students_sessions
    @course_session.update(course_session_params)
    respond_with(@course_session)
  end

  def destroy
    @course_session.destroy
    respond_with(@course_session)
  end

  private
    def set_course_session
      @course_session = CourseSession.find(params[:id])
    end

    def course_session_params
      params.require(:course_session).permit(:title, :time, :duration, 
                                             :course_id, :course_period_id, 
                                             :active, :instructor_id, :user_ids => [])
    end
end
