class CreateCourseSessions < ActiveRecord::Migration
  def change
    create_table :course_sessions do |t|
      t.string  :title
      t.string  :time
      t.string  :duration  
      t.string  :instructor
      t.integer :course_id
      t.timestamps
    end
  end
end
