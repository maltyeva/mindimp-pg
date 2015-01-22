class CourseCategory < ActiveRecord::Base


	has_many :courses
	validates_presence_of :title, :description

end
