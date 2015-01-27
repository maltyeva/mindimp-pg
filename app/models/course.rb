class Course < ActiveRecord::Base

	#The Associations involved with course
	belongs_to :course_category
	belongs_to :book_category
	has_many :course_sessions

	#validations
	validates_presence_of :title, :abbreviation, :description, :session_no, :course_category
	validates_uniqueness_of :title, :abbreviation


	#creating the syllabus attachment
	has_attached_file :syllabus 

    validates_attachment_content_type :syllabus, :content_type => ['application/pdf', 'application/msword', 'text/plain']
    validates_with AttachmentSizeValidator, :attributes => :syllabus, :less_than => 10.megabytes



end
