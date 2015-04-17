class AddVisibleColumnToCoursePackets < ActiveRecord::Migration
  def change
  	add_column :course_packets, :visible, :boolean, :default => false 
  end
end
