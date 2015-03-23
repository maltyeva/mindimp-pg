class CreateCourseMeetings < ActiveRecord::Migration
  def change
    create_table :course_meetings do |t|
    	t.integer :course_session_id
    	t.text :instructor_notes
    	t.text :preparation_notes
    	t.text :class_notes

        t.timestamps
    end
  end
end
