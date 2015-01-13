class AddBooksToCategories < ActiveRecord::Migration
  def change
    add_column :books, :book_category_id, :integer
  end
end
