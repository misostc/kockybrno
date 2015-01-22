class Cat < ActiveRecord::Base
  belongs_to :user
  belongs_to :tomcat
  belongs_to :kitten

  has_attached_file :image,
                    :styles => {:medium => '600x400>'}
  validates_attachment_content_type :image,
                                    :content_type => %w(image/jpeg image/gif image/png)
  validates :image, :attachment_presence => true

  validates :name, :presence => true
  validates :description, :presence => true
  validates :born_at, :presence => true
end
