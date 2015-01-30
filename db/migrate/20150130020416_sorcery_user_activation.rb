class SorceryUserActivation < ActiveRecord::Migration
  def change
    add_column :users, :activation_state, :string, :default => nil
    add_column :users, :activation_token, :string, :default => nil
    add_column :users, :activation_token_expires_at, :datetime, :default => nil
 	remove_column :users, :activated
 	remove_column :users, :activated_at



    add_index :users, :activation_token
  end
end