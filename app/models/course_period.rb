class CoursePeriod < ActiveRecord::Base


	has_many :course_sessions, dependent:  :destroy

	validates_presence_of :title
	#validates_uniqueness_of :active
end
