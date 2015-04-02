class CreateArticleLists < ActiveRecord::Migration
  def change
    create_table :article_lists do |t|
      t.integer :watcher_id
      t.integer :article_id

      t.timestamps
    end
    add_index :article_lists, :watcher_id
    add_index :article_lists, :article_id	
    add_index :article_lists, [:watcher_id, :article_id], unique: true  
  end
end
