class Course < ActiveRecord::Base

	validates_presence_of :title, :abbreviation, :description, :session_no

end
