class AddCourseStudentsToCoursePeriods < ActiveRecord::Migration
  def change
  	add_column :users, :course_period_id, :integer
  end
end
