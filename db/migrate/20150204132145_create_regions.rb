class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
    add_index :regions, :name, unique: true
  end
end
