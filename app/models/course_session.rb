class CourseSession < ActiveRecord::Base

	#this handles the associations
	belongs_to :course
	belongs_to :course_period
	belongs_to :instructor, :class_name => "User", foreign_key: "instructor_id"


    has_many :assessments
	has_many :course_assignments
	has_many :course_meetings
    has_and_belongs_to_many :users, join_table: :students_sessions


	validates_presence_of :title, :course, :course_period

 def full_title
     [course.title, title].join(": ")
  end

end
