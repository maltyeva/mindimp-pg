class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]
  
  before_filter :require_login
  before_filter :load_user

  before_filter :require_admin, only: [:edit, :index, :update, :new, :create]
  before_filter :correct_user, only: [:show]



  respond_to :html

  def index
    @assessments = @user.assessments.all
    respond_with(@assessments)
  end

  def show
    respond_with(@user, @assessment)
  end

  def new
    @assessment = @user.assessments.new
    @course_sessions = CourseSession.joins("join students_sessions on course_sessions.id = students_sessions.course_session_id").where("students_sessions.user_id = ?", @user.id)
    respond_with(@assessment)
  end

  def edit
  end

  def create
    @assessment = @user.assessments.new(assessment_params)
    @assessment.save
    UserMailer.create_assessment_email(@user, @assessment).deliver
    flash[:notice] = "Successfully created assessment and sent notification email"
    respond_with(@user, @assessment)
  end

  def update
    @assessment.update(assessment_params)
    respond_with(@assessment)
  end

  def destroy
    @assessment.destroy
    respond_with(@assessment)
  end

  private

    def load_user
      @user = User.find(params[:user_id])
    end


    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    def assessment_params
      params.require(:assessment).permit(:effort_grade, :effort_comments, :communication_grade, 
                                         :communication_comments, :eng_writing_grade, :eng_writing_comments, 
                                         :eng_speaking_grade, :eng_speaking_comments, :eng_reading_grade, 
                                         :eng_reading_comments, :crit_thinking_grade, :crit_thinking_comments, 
                                         :progress_grade, :progress_comments, :gen_comments, :user_id, 
                                         :course_session_id)
    end


end
