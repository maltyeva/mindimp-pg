class ChangeArticlesLevelToString < ActiveRecord::Migration
  def change
  	change_column :articles, :level, :string
  end
end
