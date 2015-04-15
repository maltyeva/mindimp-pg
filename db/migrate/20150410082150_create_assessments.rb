class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :effort_grade
      t.text   :effort_comments
      t.string :communication_grade
      t.text   :communication_comments
      t.string :eng_writing_grade
      t.text   :eng_writing_comments
      t.string :eng_speaking_grade
      t.text   :eng_speaking_comments
      t.string :eng_reading_grade
      t.text   :eng_reading_comments
      t.string :crit_thinking_grade
      t.text   :crit_thinking_comments
      t.string :progress_grade
      t.text   :progress_comments
      t.text   :gen_comments

      t.timestamps
    end
  end
end
