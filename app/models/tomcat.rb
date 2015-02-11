class Tomcat < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image,
                    styles: { medium: '295x295#', original: '800x600>' }
  validates_attachment_content_type :image,
                                    content_type: %w(image/jpeg image/gif image/png)
  validates :image, attachment_presence: true

  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true
  default_scope { order(created_at: :desc) }

  def defaults
    self.confirmed = false
  end
end
