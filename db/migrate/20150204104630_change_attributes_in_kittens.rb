class ChangeAttributesInKittens < ActiveRecord::Migration
  def change
    remove_column :kittens, :name
    add_column :kittens, :born_at, :date
  end
end
