class AddAttachmentLogoToBenefits < ActiveRecord::Migration
  def self.up
    change_table :benefits do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :benefits, :logo
  end
end
