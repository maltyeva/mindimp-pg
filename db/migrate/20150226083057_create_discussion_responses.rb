class CreateDiscussionResponses < ActiveRecord::Migration
  def change
    create_table :discussion_responses do |t|
      t.text :response
      t.integer :user_id
      t.integer :discussion_question_id
      t.timestamps
    end
  end
end
