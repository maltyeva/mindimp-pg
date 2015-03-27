class CreateCourseFiles < ActiveRecord::Migration
  def change
    create_table :course_files do |t|
      t.string :title
      t.integer :course_packet_id

      t.timestamps
    end
  end
end
