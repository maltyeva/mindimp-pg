class CreateCoursePeriods < ActiveRecord::Migration
  def change
    create_table :course_periods do |t|
      t.string    :title
      t.integer   :year
      t.integer   :period_no
      t.timestamps
    end
  end
end
