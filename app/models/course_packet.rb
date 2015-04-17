class CoursePacket < ActiveRecord::Base

	belongs_to :course
	has_many :course_files

	validates_presence_of :title, :course_id

	accepts_nested_attributes_for :course_files


	#scopes 
  	scope :visible, lambda { where(:visible => true) }



end
