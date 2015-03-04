class AddColumnsToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :url, :string
  	add_column :books, :page_count, :integer
  end
end
