class ChangeTypeDescription < ActiveRecord::Migration
  def change
    remove_column :tomcats, :description
    remove_column :kittens, :description
    add_column :tomcats, :description, :text
    add_column :kittens, :description, :text
  end
end
