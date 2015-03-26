class CourseFile < ActiveRecord::Base

	belongs_to :course_packet


	#dealing with paperclip
	has_attached_file :file

	#need to change this not just be images
	validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
  	validates_with AttachmentSizeValidator, :attributes => :file, :less_than => 1.megabytes
end
