class AddProfileInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :hometown, :string
  	add_column :users, :high_school, :string
  	add_column :users, :bio, :text
  end
end
