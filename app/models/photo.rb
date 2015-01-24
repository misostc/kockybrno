class Photo < ActiveRecord::Base
  belongs_to :photogallery
  has_attached_file :image,
                    :styles => {:thumb => '180x135#', :original => "1024x768>"}
  validates_attachment_content_type :image,
                                    :content_type => %w(image/jpeg image/gif image/png)
  validates :title, :presence => true
  validates :image, :attachment_presence => true
  validates :photogallery, :presence => true

end
