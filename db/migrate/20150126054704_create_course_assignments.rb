class CreateCourseAssignments < ActiveRecord::Migration
  def change
    create_table :course_assignments do |t|
      t.integer    :number
      t.string     :title
      t.text       :description
      t.string     :format
      t.datetime   :due_date
      t.integer    :course_session_id
      t.timestamps
    end
  end
end
