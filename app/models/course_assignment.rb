class CourseAssignment < ActiveRecord::Base

		#association handling
		belongs_to :course_session

		validates_presence_of :title

end
