class Instructor < User

	has_many :course_sessions, foreign_key: "instructor_id"

  	def self.model_name
    	User.model_name
  	end


  	def self
    	where(is_admin: true)
  	end

end
