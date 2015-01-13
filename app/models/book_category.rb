class BookCategory < ActiveRecord::Base

		has_many :books
		validates_presence_of :title, :description 

end
