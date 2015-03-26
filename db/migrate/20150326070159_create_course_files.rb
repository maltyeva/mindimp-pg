class CreateCourseFiles < ActiveRecord::Migration
  def change
    create_table :course_files do |t|
       t.integer :course_packet_id
       t.string :name 
       t.string :description
       t.attachment :file

      t.timestamps
    end
  end
end
