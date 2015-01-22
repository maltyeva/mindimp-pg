class Course < ActiveRecord::Base

	belongs_to :course_category
	validates_presence_of :title, :abbreviation, :description, :session_no

end
