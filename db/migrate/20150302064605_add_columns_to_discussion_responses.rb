class AddColumnsToDiscussionResponses < ActiveRecord::Migration
  def change
  	add_column :discussion_questions, :visible, :boolean, :default => false
  	add_column :discussion_responses, :comments, :text
  	add_column :discussion_responses, :comment_by, :integer
  end
end
