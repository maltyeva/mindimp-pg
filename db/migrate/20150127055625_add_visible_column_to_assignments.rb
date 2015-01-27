class AddVisibleColumnToAssignments < ActiveRecord::Migration
  def change
  	add_column :course_assignments, :visible, :boolean, :default => false
  end
end
