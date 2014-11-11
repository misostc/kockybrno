class AddPrefixTitleToUser < ActiveRecord::Migration
  def change
    add_column :users, :prefix_title, :string
  end
end
