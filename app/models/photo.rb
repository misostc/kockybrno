class Photo < ActiveRecord::Base
  has_attached_file :image,
                    :styles => {:thumb => '180x135#'}
  validates_attachment_content_type :image,
                                    :content_type => %w(image/jpeg image/gif image/png)
  validates :title, :presence => true
  validates :image, :attachment_presence => true

  def self.sample(number)
    all.order('RANDOM()').limit(number)
  end

end
