class AddPeriodsToCourseSession < ActiveRecord::Migration
  def change
  	  add_column :course_sessions, :course_period_id, :integer
  end
end
