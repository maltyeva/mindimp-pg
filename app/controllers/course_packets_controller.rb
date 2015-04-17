class CoursePacketsController < ApplicationController
  before_action :set_course_packet, only: [:show, :edit, :update, :destroy]

  respond_to :html

  before_filter :require_login
  before_filter :require_admin, only: [:index, :edit, :update, :destroy, :new]

  def index
    @title = "All Course Packets"
    @course_packets = CoursePacket.all
    respond_with(@course_packets)
  end

  def resources
    @title = "Instructor Resources"
    @course_packets = CoursePacket.visible.all
    render 'index'
  end


  def show
    respond_with(@course_packet)
  end

  def new
    @course_packet = CoursePacket.new
    @course_packet.course_files.build

    respond_with(@course_packet)
  end

  def edit
    @course_packet.course_files.build
  end

  def create
    @course_packet = CoursePacket.new(course_packet_params)
    if @course_packet.save
      if params[:files]
        params[:files].each { |file|
          @course_packet.course_files.create(file: file)
        }
        end
    respond_with(@course_packet)
    end
  end

  def update
    @course_packet.update(course_packet_params)
    respond_with(@course_packet)
  end

  def destroy
    @course_packet.destroy
    respond_with(@course_packet)
  end

  private
    def set_course_packet
      @course_packet = CoursePacket.find(params[:id])
    end

    def course_packet_params
      params.require(:course_packet).permit(:title, :course_id, :visible, 
                                            course_files_attributes: [:id, :title, :image])
    end
end
