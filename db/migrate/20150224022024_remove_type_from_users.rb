class RemoveTypeFromUsers < ActiveRecord::Migration
  def change
  	 remove_column :users, :type
  	 add_column :course_sessions, :instructor_name, :string
  end
end
