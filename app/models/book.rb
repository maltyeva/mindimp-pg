class Book < ActiveRecord::Base


	has_and_belongs_to_many :book_categories, join_table: :books_categories
  has_many :discussion_questions

  
	validates_presence_of :title, :author, :description 
	validates_uniqueness_of :title, :description


#creates cover photo 
  has_attached_file :cover, 
                    :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                    :default_url => "/images/:style/book_missing.png"
                    # :storage => :dropbox,
                    # :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                    # :dropbox_options => {...}


  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :cover, :less_than => 1.megabytes

end
