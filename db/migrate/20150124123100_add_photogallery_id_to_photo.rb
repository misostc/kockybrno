class AddPhotogalleryIdToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :photogallery
  end
end
