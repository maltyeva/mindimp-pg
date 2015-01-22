class Course < ActiveRecord::Base

	belongs_to :course_category
	has_many :course_sessions
	validates_presence_of :title, :abbreviation, :description, :session_no

end
