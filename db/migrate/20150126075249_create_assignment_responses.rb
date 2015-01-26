class CreateAssignmentResponses < ActiveRecord::Migration
  def change
    create_table :assignment_responses do |t|
      t.text :text
      t.datetime :submitted
      t.string :grade
      t.text :comments
      t.attachment :attachment
      t.integer :course_assignment_id
      t.integer :user_id
      t.timestamps
    end
  end
end
