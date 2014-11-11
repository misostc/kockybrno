class AddSpeciesToUser < ActiveRecord::Migration
  def change
    add_column :users, :species, :string
  end
end
