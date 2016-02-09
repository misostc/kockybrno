class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :title
      t.text :short_description
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
