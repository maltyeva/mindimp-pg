class AssignmentResponse < ActiveRecord::Base

	belongs_to :user, foreign_key: "user_id"
	belongs_to :grader, :class_name => "User", foreign_key: "grader_id"

	belongs_to :course_assignment



	validates_presence_of :text

	#creating the  attachment
	has_attached_file :attachment 

    validates_attachment_content_type :attachment, :content_type => ['application/pdf', 'application/msword', 'text/plain']
    validates_with AttachmentSizeValidator, :attributes => :attachment, :less_than => 10.megabytes

end
