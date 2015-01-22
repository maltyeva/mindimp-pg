class CreateStudentsSessionsTable < ActiveRecord::Migration
  def change
    create_table :students_sessions_tables do |t|
      t.integer :user_id
      t.integer :course_session_id
    end
  end
end
