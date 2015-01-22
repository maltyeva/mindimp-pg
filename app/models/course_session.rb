class CourseSession < ActiveRecord::Base

	#this handles the associations
	belongs_to :course
    has_and_belongs_to_many :users, join_table: :students_sessions


	validates_presence_of :title, :course

end