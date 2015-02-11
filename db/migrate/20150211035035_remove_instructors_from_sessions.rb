class RemoveInstructorsFromSessions < ActiveRecord::Migration
  def change
  	remove_column :course_sessions, :instructor
  end
end
