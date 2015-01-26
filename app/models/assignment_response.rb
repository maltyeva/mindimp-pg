class AssignmentResponse < ActiveRecord::Base

	belongs_to :user
	belongs_to :course_assignment


	validates_presence_of :text

end
