class AddTypeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :type, :string
  	add_column :users, :skype_id, :string
  	add_column :users, :phone, :string 
  end
end
