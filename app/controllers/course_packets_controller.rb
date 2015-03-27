class CoursePacketsController < ApplicationController
  before_action :set_course_packet, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @course_packets = CoursePacket.all
    respond_with(@course_packets)
  end

  def show
    respond_with(@course_packet)
  end

  def new
    @course_packet = CoursePacket.new
    respond_with(@course_packet)
  end

  def edit
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
      params.require(:course_packet).permit(:title, :course_id)
    end
end
