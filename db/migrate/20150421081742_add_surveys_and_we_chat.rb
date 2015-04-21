class AddSurveysAndWeChat < ActiveRecord::Migration
  def change
  	add_column :course_sessions, :survey_link, :string
  	add_column :users, :wechat_id, :string
  end
end
