class CreateBookLists < ActiveRecord::Migration
  def change
    create_table :book_lists do |t|
      t.integer :watcher_id
      t.integer :book_id

      t.timestamps
    end
    add_index :book_lists, :watcher_id
    add_index :book_lists, :book_id	
    add_index :book_lists, [:watcher_id, :book_id], unique: true  
  end
end
