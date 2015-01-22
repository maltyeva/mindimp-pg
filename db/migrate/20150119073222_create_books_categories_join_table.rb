class CreateBooksCategoriesJoinTable < ActiveRecord::Migration
  def change
    create_table :books_categories do |t|
      t.integer :book_id
      t.integer :book_category_id
    end
  end
end
