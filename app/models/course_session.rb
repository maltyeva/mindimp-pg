class CourseSession < ActiveRecord::Base

	#this handles the associations
	belongs_to :course
	belongs_to :course_period
    belongs_to :instructor, :class_name => "User" #, through: :users, class_name: 'Instructor'



	has_many :course_assignments
    has_and_belongs_to_many :users, join_table: :students_sessions

# { where user_friendships: { state: "pending" } 


	validates_presence_of :title, :course


 def full_title
     [course.title, title].join(": ")
  end

end
