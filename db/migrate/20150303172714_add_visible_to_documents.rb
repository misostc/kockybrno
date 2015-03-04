class AddVisibleToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :visible, :boolean, :default => true
  end
end
