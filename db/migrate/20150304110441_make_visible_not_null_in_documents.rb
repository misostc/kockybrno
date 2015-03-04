class MakeVisibleNotNullInDocuments < ActiveRecord::Migration
  def change
    change_column_null :documents, :visible, false, true
  end
end
