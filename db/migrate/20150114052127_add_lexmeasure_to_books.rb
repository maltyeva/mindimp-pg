class AddLexmeasureToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :lexile_measure, :integer 
  end
end
