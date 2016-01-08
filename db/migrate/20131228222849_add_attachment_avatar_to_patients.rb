class AddAttachmentAvatarToPatients < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :patients, :avatar
  end
end
