class ChangeAttributesInTomcats < ActiveRecord::Migration
  def change
    add_column :tomcats, :ems, :string
  end
end
