class AddDiscussionQuestionLabels < ActiveRecord::Migration
  def change
  	add_column :discussion_questions, :chapters, :string
  	rename_column :discussion_questions, :question_number, :week_number
  end
end
