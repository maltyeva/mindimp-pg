class Book < ActiveRecord::Base


	has_and_belongs_to_many :book_categories, join_table: :books_categories
  has_many :discussion_questions, dependent: :destroy
  
	validates_presence_of :title, :author, :description 
	validates_uniqueness_of :title


 #complicated relationships between books & users  
  has_many :book_lists, dependent: :destroy
  has_many :watchers, through: :book_lists, class_name: "User", foreign_key: "watcher_id"


  belongs_to :read_books, dependent: :destroy
  has_many :readers, through: :read_books, class_name: "User", foreign_key: "reader_id"



#creates cover photo 
  has_attached_file :cover, 
                    :styles => { :medium => "300x300>", :thumb => "50x50>" }, 
                    :default_url => "/images/:style/book_missing.png"
                    # :storage => :s3


  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :cover, :less_than => 1.megabytes

end
