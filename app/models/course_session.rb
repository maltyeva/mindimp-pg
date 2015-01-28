class CourseSession < ActiveRecord::Base

	#this handles the associations
	belongs_to :course
	belongs_to :course_period
	has_many :course_assignments
    has_and_belongs_to_many :users, join_table: :students_sessions
   # has_one :instructor



	validates_presence_of :title, :course


 def full_title
     [course.title, title].join(": ")
  end

end
