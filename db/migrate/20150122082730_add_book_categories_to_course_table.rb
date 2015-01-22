class AddBookCategoriesToCourseTable < ActiveRecord::Migration
  def change
  	  add_column :courses, :book_category_id, :integer
  end
end
