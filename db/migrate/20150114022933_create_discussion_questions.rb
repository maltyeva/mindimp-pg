class CreateDiscussionQuestions < ActiveRecord::Migration
  def change
    create_table :discussion_questions do |t|
      t.text :question
      t.integer :question_number
      t.integer :book_id 	

      t.timestamps
    end
  end
end
