class CourseFile < ActiveRecord::Base

	belongs_to :course_packet


	#dealing with paperclip
	has_attached_file :file

	# validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  	# validates_with AttachmentSizeValidator, :attributes => :cover, :less_than => 1.megabytes
end
