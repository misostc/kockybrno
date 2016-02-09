class Banner < ActiveRecord::Base
  has_attached_file :image,
    styles: { big: "720x150#" },
    :convert_options => {big: "-quality 75 -strip" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, attachment_presence: true
  validates :link, presence:true
  validates :link, :format => URI::regexp(%w(http https))
end
