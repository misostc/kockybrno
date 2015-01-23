class AddBornAtToTomcats < ActiveRecord::Migration
  def change
    add_column :tomcats, :born_at, :date
  end
end
