class DiscussionQuestion < ActiveRecord::Base

	belongs_to :book
	belongs_to :article
	has_many :discussion_responses, dependent: :destroy
	
	validates_presence_of :question, :book_id


  	scope :visible, where(:visible => true)

end
