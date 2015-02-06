class AddConfirmedToKittens < ActiveRecord::Migration
  def change
    add_column :kittens, :confirmed, :boolean
  end
end
