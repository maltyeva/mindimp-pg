class DiscussionQuestion < ActiveRecord::Base

	belongs_to :book
	belongs_to :article
	has_many :discussion_responses, dependent: :destroy
	
	validates_presence_of :question
	validate :book_or_article


	def book_or_article
  		unless book_id || article_id
    	 errors.add :base, "Must belong to an article or a book."
    	end
  	end



  	scope :visible, where(:visible => true)

end
