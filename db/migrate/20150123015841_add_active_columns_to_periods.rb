class AddActiveColumnsToPeriods < ActiveRecord::Migration
  def change
  	add_column :course_periods, :active, :boolean
  	add_column :course_periods, :upcoming, :boolean
  	add_column :course_periods, :past, :boolean
  end
end
