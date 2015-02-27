class DiscussionResponse < ActiveRecord::Base

	belongs_to :discussion_question
	belongs_to :user
	
	validates_presence_of :response, :discussion_question_id
end
