class AddSortOrdertoDiscussionQuestions < ActiveRecord::Migration
  def change
  	add_column :discussion_questions, :sort_order, :integer 
  end
end
