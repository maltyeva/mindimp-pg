class AssignmentResponsesController < ApplicationController
  before_action :set_assignment_response, only: [:show, :edit, :update, :destroy]

  respond_to :html


  before_filter :require_login
  before_filter :require_admin, only: [:edit, :index, :update]

  def index
    @assignment_responses = AssignmentResponse.all
    respond_with(@assignment_responses)
  end

  def show
    respond_with(@assignment_response)
  end

  def new
    @assignment_response = AssignmentResponse.new
    respond_with(@assignment_response)
  end

  def edit
  end

  def create
    @assignment_response = AssignmentResponse.new(assignment_response_params)
    @assignment_response.save
    respond_with(@assignment_response)
  end

  def update
    @assignment_response.update(assignment_response_params)
    respond_with(@assignment_response)
  end

  def destroy
    @assignment_response.destroy
    respond_with(@assignment_response)
  end

  private
    def set_assignment_response
      @assignment_response = AssignmentResponse.find(params[:id])
    end

    def assignment_response_params
      params.require(:assignment_response).permit(:text, :submitted, :grade, :attachment, 
                                                  :course_assignment_id, :user_id)
    end
end
