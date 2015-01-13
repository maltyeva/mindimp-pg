class Book < ActiveRecord::Base


	belongs_to :book_category 
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
