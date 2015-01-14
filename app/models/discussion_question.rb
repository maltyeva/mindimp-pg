class DiscussionQuestion < ActiveRecord::Base

	belongs_to :book
	validates_presence_of :question, :question_number, :book_id
end
