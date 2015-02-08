class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true
  paginates_per 7
end
