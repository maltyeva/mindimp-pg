class AddBooksToCategories < ActiveRecord::Migration
  def change
    add_column :book_categories, :book_id, :integer
  end
end
