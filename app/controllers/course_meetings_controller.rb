class CourseMeetingsController < ApplicationController
  before_action :set_course_meeting, only: [:show, :edit, :update, :destroy]

  respond_to :html


  before_filter :require_login
  before_filter :load_course_session

  before_filter :require_admin, only: [:edit, :index, :update, :show]


  def index
    @course_meetings = @course_session.course_meetings.all
    respond_with(@course_meetings)
  end

  def show
    respond_with(@course_meeting)
  end

  def new
    @course_meeting = @course_session.course_meetings.new
    respond_with(@course_meeting)
  end

  def edit
  end

  def create
    @course_meeting = @course_session.course_meetings.new(course_meeting_params)
    @course_meeting.save
    respond_with(@course_session, @course_meeting)
  end

  def update
    @course_meeting.update(course_meeting_params)
    respond_with(@course_session, @course_meeting)
  end

  def destroy
    @course_meeting.destroy
    redirect_to course_sessions_path  
  end

  private

    def load_course_session
      @course_session = CourseSession.find(params[:course_session_id])
    end

    def set_course_meeting
      @course_meeting = CourseMeeting.find(params[:id])
    end

    def course_meeting_params
      params.require(:course_meeting).permit(:course_session_id, :instructor_notes, 
                                             :preparation_notes, :class_notes, :title)
    end
end
