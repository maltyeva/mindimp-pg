class ArticleSource < ActiveRecord::Base

	validates_presence_of :title

	has_many :articles, dependent: :nullify

	has_attached_file :photo,
                 	  :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                      :default_url => "/images/:style/article_missing.jpeg"
                      # :storage => :s3

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :photo, :less_than => 1.megabytes



end
