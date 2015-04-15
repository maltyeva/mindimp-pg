class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @assessments = Assessment.all
    respond_with(@assessments)
  end

  def show
    respond_with(@assessment)
  end

  def new
    @assessment = Assessment.new
    respond_with(@assessment)
  end

  def edit
  end

  def create
    @assessment = Assessment.new(assessment_params)
    @assessment.save
    respond_with(@assessment)
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
