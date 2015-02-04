class Kitten < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image,
                    :styles => {:medium => '600x400>'}
  validates_attachment_content_type :image,
                                    :content_type => %w(image/jpeg image/gif image/png)
  validates :image, :attachment_presence => true
  validates :user, :presence => true
  validates :description, :presence => true

end
