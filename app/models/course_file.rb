class CourseFile < ActiveRecord::Base

	belongs_to :course_packet


	#yes, this is called image but this is for all attachments. 
	has_attached_file :image, :styles => { :small => "150x150>", :large => "320x240>" }
	
	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 10.megabytes
	validates_attachment_content_type :image, :content_type => ['application/pdf', 'application/msword', 'text/plain', 'image/jpeg', 'image/png', 'application/zip', 'application/rar']

	before_post_process :skip_for_zip


	def skip_for_zip
   	! %w(application/zip application/rar).include?(image.content_type)
	end


end
