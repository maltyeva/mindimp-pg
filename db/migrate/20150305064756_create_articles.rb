class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :source
      t.string :url
      t.string :category
      t.datetime :published
      
      t.timestamps
    end
    add_column :discussion_questions, :article_id, :integer
  end
end
