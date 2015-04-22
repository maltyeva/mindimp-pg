class Article < ActiveRecord::Base

	validates_presence_of :title, :author, :source


	belongs_to :article_source

	has_many :discussion_questions
  	has_many :article_lists, dependent: :destroy
  	has_many :watchers, through: :article_lists, class_name: "User", foreign_key: "watcher_id"



	#creating the attachment
	has_attached_file :attachment 

    validates_attachment_content_type :attachment, :content_type => ['application/pdf', 'application/msword', 'text/plain']
    validates_with AttachmentSizeValidator, :attributes => :attachment, :less_than => 10.megabytes

end
