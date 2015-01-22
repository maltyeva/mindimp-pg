class BookCategory < ActiveRecord::Base

		has_and_belongs_to_many :books, join_table: :books_categories
		has_one :course

		validates_presence_of :title, :description 

end
