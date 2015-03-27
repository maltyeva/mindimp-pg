class AddAttachmentImageToCourseFiles < ActiveRecord::Migration
  def self.up
    change_table :course_files do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :course_files, :image
  end
end
