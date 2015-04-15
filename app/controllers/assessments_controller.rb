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
      params[:assessment]
    end
end
