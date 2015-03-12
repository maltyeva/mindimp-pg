class AddPermissionsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :articles, :boolean, :detault => false
  	add_column :users, :books, :boolean, :detault => false
  	add_column :users, :courses, :boolean, :detault => false

  end
end
