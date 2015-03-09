class Article < ActiveRecord::Base

	validates_presence_of :title, :author, :source

	has_many :discussion_questions

	#creating the attachment
	has_attached_file :attachment 

    validates_attachment_content_type :attachment, :content_type => ['application/pdf', 'application/msword', 'text/plain']
    validates_with AttachmentSizeValidator, :attributes => :attachment, :less_than => 10.megabytes

end
