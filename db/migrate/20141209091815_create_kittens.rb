class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.integer :cat_id
      t.string :sex

      t.timestamps
    end
  end
end
