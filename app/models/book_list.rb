class BookList < ActiveRecord::Base

	belongs_to :user, class_name: "User", foreign_key: "watcher_id"
	belongs_to :book

	validates :watcher_id, presence: true
  	validates :book_id, presence: true

end
