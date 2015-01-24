class CreatePhotogalleries < ActiveRecord::Migration
  def change
    create_table :photogalleries do |t|
      t.string :name

      t.timestamps
    end
  end
end
