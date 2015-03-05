class Article < ActiveRecord::Base

	validates_presence_of :title, :author, :source

	has_many :discussion_questions

end
