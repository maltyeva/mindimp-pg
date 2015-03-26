class CourseFilesController < ApplicationController
  before_action :set_course_file, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @course_files = CourseFile.all
    respond_with(@course_files)
  end

  def show
    respond_with(@course_file)
  end

  def new
    @course_file = CourseFile.new
    respond_with(@course_file)
  end

  def edit
  end

  def create
    @course_file = CourseFile.new(course_file_params)
    @course_file.save
    respond_with(@course_file)
  end

  def update
    @course_file.update(course_file_params)
    respond_with(@course_file)
  end

  def destroy
    @course_file.destroy
    respond_with(@course_file)
  end

  private
    def set_course_file
      @course_file = CourseFile.find(params[:id])
    end

    def course_file_params
      params.require(:course_file).permit(:title, :description, :course_packet_id, :file)
    end
end
