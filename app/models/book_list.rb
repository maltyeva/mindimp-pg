class BookList < ActiveRecord::Base

	belongs_to :watcher, class_name: "User"
	belongs_to :book

	validates :watcher_id, presence: true
  	validates :book_id, presence: true

end
