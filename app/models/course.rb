class Course < ActiveRecord::Base

	belongs_to :course_category
	belongs_to :book_category
	has_many :course_sessions
	validates_presence_of :title, :abbreviation, :description, :session_no, :course_category

	#creating the syllabus

	has_attached_file :syllabus 
                    # :storage => :dropbox,
                    # :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    # :dropbox_options => {...}

    validates_attachment_content_type :syllabus, :content_type => ['application/pdf', 'application/msword', 'text/plain']
    validates_with AttachmentSizeValidator, :attributes => :syllabus, :less_than => 10.megabytes



end
