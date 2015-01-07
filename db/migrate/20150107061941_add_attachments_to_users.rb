class AddAttachmentsToUsers < ActiveRecord::Migration
  def change
  	 add_attachment :users, :profile_photo
  end
end
