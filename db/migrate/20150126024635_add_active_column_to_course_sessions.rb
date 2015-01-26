class AddActiveColumnToCourseSessions < ActiveRecord::Migration
  def change
  	add_column :course_sessions, :active, :boolean
  end
end
