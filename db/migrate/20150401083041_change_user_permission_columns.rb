class ChangeUserPermissionColumns < ActiveRecord::Migration
  def change
  	rename_column :users, :books, :books_permissions
  	rename_column :users, :courses, :courses_permissions
  	rename_column :users, :articles, :articles_permissions


  end
end
