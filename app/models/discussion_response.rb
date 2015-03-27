class DiscussionResponse < ActiveRecord::Base

	belongs_to :discussion_question
	belongs_to :user
	
	validates_presence_of :response, :discussion_question_id

	def book
    	self.discussion_question.book.title 
 	end

 	#alright, let's define some scope
    # scope :books, 
    # 	joins(:discussion_questions).
    # 	includes(:discussion_questions).
    # 	where(article_id: => nil)


end
