class AddAttachmentImageToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :Photo, :photos
  end
end
