class Image < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image,
                                    :content_type => ["image/jpeg", "image/gif", "image/png"],
                                    :styles => { :thumb => "180x135>" },
                                    :processors => [:thumbnail]
  validates :title, :presence => true
  validates :image, :attachment_presence => true
end
