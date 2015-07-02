class Article < ActiveRecord::Base
  extend Enumerize
  validates :title, presence: true
  validates :text, presence: true
  validates :kind, presence: true
  paginates_per 7
  default_scope { order(created_at: :desc) }

  enumerize :kind, in: [:news, :education], default: :news
end
