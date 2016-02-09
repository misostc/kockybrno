class Benefit < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  validates :logo, attachment_presence: true
  validates :title, presence:true
  validates :link, presence:true
  validates :short_description, presence: true
  validates :link, :format => URI::regexp(%w(http https))
end
