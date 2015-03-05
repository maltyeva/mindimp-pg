class AddColumnsToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :description, :text
  	add_column :articles, :word_count, :integer
  	add_column :articles, :level, :integer
  end
end
