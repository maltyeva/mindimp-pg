class Assessment < ActiveRecord::Base

	validates_presence_of :user_id, :course_session_id

	belongs_to :user
	belongs_to :course_session
end
