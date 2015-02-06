class AddConfirmedToTomcats < ActiveRecord::Migration
  def change
    add_column :tomcats, :confirmed, :boolean
  end
end
