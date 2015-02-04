class Region < ActiveRecord::Base
  validates :name, presence: true
  validates :content, presence: true

  def self.get(name)
    Region.all.where(name: name).first
  end
end
