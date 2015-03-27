class CoursePacket < ActiveRecord::Base

	belongs_to :course
	has_many :course_files, dependent: :destroy

	validates_presence_of :title, :course_id
end
