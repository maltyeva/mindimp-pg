class AddInstructorsToSessions < ActiveRecord::Migration
  def change
  	add_column :course_sessions, :instructor_id, :integer
  end
end
