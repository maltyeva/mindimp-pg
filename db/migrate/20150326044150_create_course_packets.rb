class CreateCoursePackets < ActiveRecord::Migration
  def change
    create_table :course_packets do |t|
      t.string :title
      t.integer :course_id 
      
      t.timestamps
    end
  end
end
