class AddImageToCats < ActiveRecord::Migration
  def self.up
    add_attachment :cats, :image
  end

  def self.down
    remove_attachment :cats, :image
  end
end
