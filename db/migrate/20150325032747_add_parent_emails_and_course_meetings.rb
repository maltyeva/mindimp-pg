class AddParentEmailsAndCourseMeetings < ActiveRecord::Migration
  def change
  	add_column :users, :parent_email, :string
  	add_column :users, :parent_name, :string
  	add_column :course_meetings, :title, :string
  end
end
