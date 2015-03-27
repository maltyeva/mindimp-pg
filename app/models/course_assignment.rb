class CourseAssignment < ActiveRecord::Base

		#association handling
		belongs_to :course_session
		has_many :assignment_responses, dependent: :destroy

		validates_presence_of :title

end
