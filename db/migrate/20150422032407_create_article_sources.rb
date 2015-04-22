class CreateArticleSources < ActiveRecord::Migration
  def change
    create_table :article_sources do |t|
    	t.string :title
    	t.string :url
    	t.string :description
    	t.attachment :photo
      	t.timestamps
    end
    add_column :articles, :article_source_id, :integer
  end
end
