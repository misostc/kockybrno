class CreateTomcats < ActiveRecord::Migration
  def change
    create_table :tomcats do |t|
      t.integer :cat_id
      t.string :tests

      t.timestamps
    end
  end
end
