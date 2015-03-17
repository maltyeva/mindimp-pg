class CourseAssignmentsController < ApplicationController
  before_action :set_course_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  before_filter :require_login
  before_filter :require_admin, only: [:edit, :new, :index]


  def index
    @course_assignments = CourseAssignment.all
    respond_with(@course_assignments)
  end

  def show
    respond_with(@course_assignment)
  end

  def new
    @course_assignment = CourseAssignment.new
    respond_with(@course_assignment)
  end

  def edit
  end

  def create
    @course_assignment = CourseAssignment.new(course_assignment_params)
    @course_assignment.save
    @users = @course_assignment.course_session.users
    @users.each do |u|
        UserMailer.create_assignment_email(u, @course_assignment).deliver
      end
    respond_with(@course_assignment)
    flash[:notice] = "Created Assignment and sent notification"
  end

  def update
    @course_assignment.update(course_assignment_params)
    respond_with(@course_assignment)
  end

  def destroy
    @course_assignment.destroy
    respond_with(@course_assignment)
  end

  private
    def set_course_assignment
      @course_assignment = CourseAssignment.find(params[:id])
    end

    def course_assignment_params
      params.require(:course_assignment).permit(:title, :description, :description, :format, 
                                                :due_date, :course_session_id, :number, :visible)
    end
end
