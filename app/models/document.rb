class Document < ActiveRecord::Base
  has_attached_file :document
  validates_attachment_content_type :document, :content_type => "application/pdf"
  validates :title, :presence => true
  validates :document, :attachment_presence => true
end
