class AddTitleToBanner < ActiveRecord::Migration
  def change
    add_column :banners, :title, :string
  end
end
