class ReadBook < ActiveRecord::Base
	belongs_to :reader, class_name: "User", foreign_key: "reader_id"
	belongs_to :book, class_name: "Book", foreign_key: "read_book_id"

	validates :reader_id, presence: true
  	validates :read_book_id, presence: true
end
