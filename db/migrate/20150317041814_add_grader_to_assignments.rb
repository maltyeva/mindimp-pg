class AddGraderToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignment_responses, :grader_id, :integer
  end
end
