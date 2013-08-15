class AddAttachmentAvatarToWorks < ActiveRecord::Migration
  def self.up
    change_table :works do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :works, :avatar
  end
end
