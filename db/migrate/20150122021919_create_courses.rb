class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string       :title
      t.string       :abbreviation
      t.string       :description
      t.attachment   :syllabus
      t.integer      :session_no
      t.integer      :course_category_id
      t.timestamps
    end
  end
end
