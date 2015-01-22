class CourseSession < ActiveRecord::Base


	belongs_to :course
	validates_presence_of :title, :course

end
