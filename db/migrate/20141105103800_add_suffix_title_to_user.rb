class AddSuffixTitleToUser < ActiveRecord::Migration
  def change
    add_column :users, :suffix_title, :string
  end
end
