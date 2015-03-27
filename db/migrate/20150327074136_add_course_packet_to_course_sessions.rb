class AddCoursePacketToCourseSessions < ActiveRecord::Migration
  def change
  	add_column :course_sessions, :has_course_packet, :boolean, :default => false
  end
end
