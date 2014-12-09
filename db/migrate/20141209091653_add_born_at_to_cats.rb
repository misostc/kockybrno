class AddBornAtToCats < ActiveRecord::Migration
  def change
    add_column :cats, :born_at, :date
  end
end
