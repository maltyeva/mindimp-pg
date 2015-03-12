class AddCollegeFieldToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :college, :string
  	add_column :users, :major, :string
  	add_column :users, :hobbies, :string
  	add_column :users, :fav_book, :string
  end
end
