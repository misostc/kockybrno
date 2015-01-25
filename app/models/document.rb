class Document < ActiveRecord::Base
  has_attached_file :document
  validates_attachment_content_type :document, :content_type =>
      %w{
        application/pdf
        application/msword
        application/vnd.openxmlformats-officedocument.wordprocessingml.document
        application/vnd.ms-excel
        application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
        application/vnd.ms-powerpoint
        application/vnd.openxmlformats-officedocument.presentationml.presentation
        application/vnd.openxmlformats-officedocument.presentationml.slideshow
      }
  validates :title, :presence => true
  validates :document, :attachment_presence => true
  acts_as_punchable
end
