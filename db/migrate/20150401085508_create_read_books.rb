class CreateReadBooks < ActiveRecord::Migration
  def change
    create_table :read_books do |t|
      t.integer :reader_id
      t.integer :read_book_id

      t.timestamps
    end
    add_index :read_books, :reader_id
    add_index :read_books, :read_book_id	
    add_index :read_books, [:reader_id, :read_book_id], unique: true  
  end
end
