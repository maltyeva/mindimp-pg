class CoursePeriod < ActiveRecord::Base


	has_many :course_sessions, dependent:  :destroy
	has_many :users

	validates_presence_of :title
	#validates_uniqueness_of :active
end
