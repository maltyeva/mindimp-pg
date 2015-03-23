class CourseMeeting < ActiveRecord::Base

	belongs_to :course_session 

	validates_presence_of :course_session_id
end
