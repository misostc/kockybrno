class RearrangeCats < ActiveRecord::Migration
  def change
    remove_column :tomcats, :cat_id
    remove_column :kittens, :cat_id
    add_column :tomcats, :user_id, :integer
    add_column :kittens, :user_id, :integer
    add_column :tomcats, :name, :string
    add_column :kittens, :name, :string
    add_column :tomcats, :breed, :string
    add_column :kittens, :breed, :string
    add_column :tomcats, :station, :string
    add_column :kittens, :station, :string
    add_column :tomcats, :description, :string
    add_column :kittens, :description, :string
    add_attachment :tomcats, :image
    add_attachment :kittens, :image
  end
end
